Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC437636DD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570452.892231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3C-0001UI-IV; Wed, 26 Jul 2023 12:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570452.892231; Wed, 26 Jul 2023 12:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3C-0001RO-Du; Wed, 26 Jul 2023 12:55:34 +0000
Received: by outflank-mailman (input) for mailman id 570452;
 Wed, 26 Jul 2023 12:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOe3B-0001CQ-3h
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:55:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b36a6c9f-2bb3-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 14:55:30 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 08:55:26 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB4964.namprd03.prod.outlook.com (2603:10b6:408:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 12:55:25 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 12:55:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b36a6c9f-2bb3-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690376131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=bMzgoEGHShhbiGsSDEpVwuBzCaDU2yGfCvh44S0Z3qQ=;
  b=Erf8FKv2YH6y1qP+A928acrHb2AMSL7AL8KPp5IVHuK9+jCQqjbGU83g
   FsS6uU/kqpDzXMCeS3v927UvYolVgkxPGhyEinFJSGXuo7CSgAydmVglU
   Ib4l5qGeazbSD06dlWTeTvqwZNtvf6SgXTXxEb8nsjBLiytZ3KdWOch8j
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 120127620
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:veLOHKAxjqi+VhVW/xXiw5YqxClBgxIJ4kV8jS/XYbTApG8i1z1Tz
 mIaDGGEPK6NMDSjet4kad+xpxkC757RzIc2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3ecwK0EX2
 84idhctXxmypum75++VVbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCr13LCRx3uTtIQ6PpGj2/Izu3Cvm3ESDRcaFkS/+uKIoxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnp+XoC2zP24JLGYETS4CUQYBpdLkpekOYgnnS99iFOu/iI3zEDSpm
 jSS9nFg1vMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswaByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:h5Kqoq6NGMH8xBKXzwPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3A/6twHWlOkxUsGjE1gFpYQBlolIzXOVrci13wemG?=
 =?us-ascii?q?KMzhOaIyceH6b9YQ5vdU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AgYWqrgzLeAtcmp1AY4YwAZgyrt2aqI6CE20ByK4?=
 =?us-ascii?q?rh5SZNCl6N3SCiG+sc6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,232,1684814400"; 
   d="scan'208";a="120127620"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzBIK6YZDTIP5DWTjpYUuszDOxjnRx4ppz1IBHpVFhBJIH5zcKji9OL0Lis3D+add8m+HJ1qENAaNV8777oId2yQeIhaMQcImCCzX4yjvRMHXgk26Km5U7eSco/WyX3NT4wLJyjEn0j92Eey9veZUmVkgXTw2xajOvLi/qnCfE9TB+KYhB7pxuwqHy839a7kwqIjrQzKR2wd31hquM+hmAIcllmaKidKSFx24ig8CU82uOTXvehcYARRbLBusJpymXz9c+5C8JFqrD7jjp2TPxxmlwzdjymIONQZKaC5ZX3F93kj23KqXbMgMTnalKQLO/VImISY13Trtiyihpej7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4+akuxj11Pm6MmCcIs2+XB2xj50RQ6f8LRImtxUdTY=;
 b=Cq7pMRXbRDnLGQjGdGxF5qZp1NvptzIuPSMJ4nU+7wUi4rZftCGGpRWVix0mj5sGB678WJM8a1PHC4h46an2v8R1/2T3cNK2Z3mcpqCeP74q9lawdUHfuxHz0uSTNsdBGZj5AkB+ItFcoUDvoCTg3L5IL0485MU9QNGG4wtCYfD5maNMq/n0efTCUkAwox3dpKpTnIC+xOirPCevPY2b2NVJOTPrgFYenRI08VkaD/sa2w8KUmtO3aQtbc8/uJLfGuNBCzBAx0G+hqz4vEk2gA759NDDcRXfWLiL7Arb19lke2S0uV87tUzyt22LdH+w4M4XxhYDU6GZVT1RxSiZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4+akuxj11Pm6MmCcIs2+XB2xj50RQ6f8LRImtxUdTY=;
 b=YGQEu1EDh64fe+NsBtzBeaUjv3G+bMX2yqk8DkuEgQySGycdNgZVUq482DA98IukQfN1G2q1/hk9RaU4naOFXrVpknt/MEs+bKLttDy/uMH2yYu+HGhD9f//8Mq/bKx3fMXhMdelzSM7lYWnC371qaQZON/+7/OzO27KCXJWagM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 1/4] x86/ioapic: add a raw field to RTE struct
Date: Wed, 26 Jul 2023 14:55:05 +0200
Message-ID: <20230726125508.78704-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726125508.78704-1-roger.pau@citrix.com>
References: <20230726125508.78704-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 9165da2f-8aec-4ed7-a238-08db8dd7942e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mEpAiIZsL1RG3FSHtj+lZIxpOIn3ANWHSxxAa2L+FqbRPkWXCEVFDahluBXgN7WnWWWGxtd2yALcOipdhEdrRiZdaiB+NNYMjQrdNTcVvg6AgygiTFSJHfpvAyfS8mrr5mGFJ9XGvYVavR+80ZI3DivAu7vENt7W8LpE81Xa9bPwPpTs5eckMUdmSF866T3K8KNehgqLUaG7Jl92BfwnKW8uGuAaUTUlrcY4bjJH+ZhLKw9wK89FJ/SnIeFrSR3mMl/GxLaLFUl4gDcYwWGU7ZoLPKxWmBkDC9WfE5mIl5JJrOPsDsXXE93OvLQzXL9Wp464Gp5g/2J1tx/qE/UTPWKhEDajFVYCm9lNiJ6ntHGwR8jmImeKl2McMMk5F1b3OGlBVUwzGt8a8uXdu5MYDXcLuY4kTuWqARTwywcKDjN2qtcqeTbOKY60spaTNcgumzCjAu9HALHfOsthCUCyYO3+41pJJr+DA3RQVdUfWaFZBtULbmAPcZ23VJeRauBL/KOkXs7hnmbXQQbvLYl5jXRbfq0W9C1K6jSdIilJFVX1NFWgS2zB6t9f5VYarVcy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(26005)(6506007)(478600001)(38100700002)(6512007)(86362001)(36756003)(6916009)(4326008)(8676002)(8936002)(186003)(316002)(66946007)(66476007)(66556008)(5660300002)(2906002)(2616005)(83380400001)(54906003)(82960400001)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGlPOWx6dktTVjdFb1Jtc0JXTTFReWNBMy8zRDRZanNoN1pwb1JMN0pZRFI2?=
 =?utf-8?B?QjBJUTNOOC9yT1JVU0NhTEQ0Y0dLc2xMbTFBUmJYWEdDNHFQaWliV05jN2lC?=
 =?utf-8?B?enNWRnBLZzh0azJpdTQ5QTl5QS8wcmZwWFV6em12K3lVYUhJYU1lc3pScE9u?=
 =?utf-8?B?eVo3Y1ByRXg1WUF0UE03Mm8xZUJ1c1dQU0VDK3dhTVRvdWpmTWNPbW1ZZU1H?=
 =?utf-8?B?QTBUaXplTlhuaU1KWVN4MEFUMHk3N0VQcXh6aWhpU2tXRzZva0tMUHJuS3VB?=
 =?utf-8?B?eEFkeUhpeU5xdkhldlBYcktQRDJBd2Roc3djVkFha1RobW9IcDZudGVFZDM4?=
 =?utf-8?B?OEpWdG5JOG42ZHNhZFJtM2EyR3lhRWZNK040NkJld0lKWHRkSEtPT2o1MFNK?=
 =?utf-8?B?Y2dQWG1HMjU0cEs3YnY2VXNFdnZqREJ4cWJiSUNqakpxYSs3QW8vb3ozMlFM?=
 =?utf-8?B?TW5QZnFNbFhiVVdLVEdqKzRIZVlESUpLRzR5UGEyVklrUTlFTm1BTUIrNW9W?=
 =?utf-8?B?NHE1UHdVb2YwTVFjMGdjVHVSc0Jpdno0ckdwRXZESS9JRW8vZXIyZW5qcmd5?=
 =?utf-8?B?dHpxdjltQXEvSlF0cjNhcGd2YlNxMGkzN0pQQUpYL3VqREF2c1puK21xUFVy?=
 =?utf-8?B?TFdnalo5RHJRcGxqTzVJV1ozNmtvK1gyVlVyc2lCdU5sV0tnTkpUSEdpYThx?=
 =?utf-8?B?VFptVWV3cHlpWmtlN1dQZHp5UDhoTTlHazBERENua0gwUEhBNGpPYWxFR21S?=
 =?utf-8?B?a0hoc3BHSEdTSFZnYUd5eFlXeXZiYU1LVUZWWjVPNXNlb0pOS3YwYXgxWEYw?=
 =?utf-8?B?U0VFNDU1c2x2WkhBRllIeE5kWEVoTW9ydU5rS3p4NWpET2ZsQUpQeVY2ZmJH?=
 =?utf-8?B?TkkyczI0eitNN1hJMTVRMDhnWkdwN3oxVFlHdmxxZ3diMlRXaHZwSXZxMUhH?=
 =?utf-8?B?U3ptbWdxeWx4Ty9UUU5QaTZZTlR5YVJhUGFyNEV1dm9SMEZaeTdWYXprMmdB?=
 =?utf-8?B?Q0wwNE55RlRMbk05Z1JhWGhTMXpWajNLY3VsNkdmenRucnpyN0V0eXNFOGZW?=
 =?utf-8?B?MGRwRXE0Y0IzdlluZm1veGhtaENBZ0cwV2k5L2xhQ1VrSGFEOVlHbjM3SThI?=
 =?utf-8?B?dTlhaXFEWkZrcmIxSGE4c05FNGNVNVNiR2R6QUpOaUgycDVTWk1Lem5NVjNv?=
 =?utf-8?B?Ymo0ZkkyY3ZkMThyRjFsY2FKQUdUQWRIVmtNOFhEQTRkZk0vRi90VW0vTjhw?=
 =?utf-8?B?Q2Y4QzV0cHl5ajh4QVR0WFdQQldrcGZUbmw0Mzk1VFVleTNQb2w0TW5jVHVY?=
 =?utf-8?B?ZTRRcnN2M0lHWVQrMUVVSTZra01LSXkvTmRCaW1WZTI5OW5oamNsNE9yNXdI?=
 =?utf-8?B?U2lJUmJtemltc2pPb0ptWXRGZDYzU1lnWEJGOFJPOFJuV2UxTXBaZkNPQTdM?=
 =?utf-8?B?a0J3eEIxSDdtaGhLWXMyOGJuaXkyMjZOTkF1TXNkM2V6M1JPb25PVGxDZkpN?=
 =?utf-8?B?ODlWSkpIWFQ4RWdUbUdZRURZNVFKaEZ3UVJNYXpLT1k5dlBnYUdxVEMyTUhX?=
 =?utf-8?B?YStFN3BYOUg1bk8xUWtsS3ZDZ0p5dnhDQlpoRDA2YmMwTzMrdEh5Q1d0WVpu?=
 =?utf-8?B?M0RVWW94MGFqYnFKTHRzZFRiQnVyck96dVlUbUpXZWJFblg2Q2FmNS8rVDBW?=
 =?utf-8?B?K0Vzajd3MVVoSmtUWnBFbDVaMlNJV0pSNnJsUzF2VnIraDNSNHBlYWRqZjlM?=
 =?utf-8?B?T1oweS84NEtRS0FIY2t3VERjS1VwU3lMaXJrSDgzdEVtZVI2Q0RRVjluZG4x?=
 =?utf-8?B?MGpZK1FOazdIQlpsVDVYcEtQTDFCZU1WOFBHVXZVbzR4Q1czRlc2VVVqZkRT?=
 =?utf-8?B?anNESVdZMnVwMHFFWVhjUU5mSjM4alc5cUt1cS9LOXRIL3d4ZEt5cUp4SXA0?=
 =?utf-8?B?UitKSkUva3RIRjJ4UTMzc055T2plVzM0c3ZrbHBsVU5kT0FBcC8vTkZ3dldU?=
 =?utf-8?B?dmp5TzNOZUxVa3RLM21DZGxOWExNUXJETGlmMVl3cjBkcldYaktrdTA5a3pC?=
 =?utf-8?B?NTQ1WktYSnJQQmxkOTZZOG9SQjZJd3lKUDhmQTJVdkdGM3lCZkVoVmZFZ25a?=
 =?utf-8?B?QVRaWU9DN005Ry8xU09iVHA5SmxoZDZUdGZiVHJTZUFVVzlaa0hQWndjcklZ?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gDprcMIUIgK/zonqQj5risU1zYm3BEKFrbaUM8JO7oN5QeGVmzWOUJUENFrnVEtgoQNkqOauCy/CmPiV9C+L2XosfzLpfQL/DwYikycygrDP4MXnrZjXfFDy9DuPrlOGGPh3MYerPiOpbBaeqd4eVmTTS0NhAAO1FJnJGXOeXRJX0D0mEbs8rZGpnQbZxqTqH+JGOuUpVASMGCaIXXE8KznaUH0nR/3Yok2eMgsqwBhz/or+4JnNjzLb+EiDrNxxfQjrluAuGWBk+Y/gx2+FixkMkURB9P8SuIE6kM0UmKPEndIMKPzV96jol0+i2u+E2Z8wOf6jButUtQFYeZa45o/c1aUyBbvR8lm4TrCqshS19wr/GlJZrf/k4klk4ZMx8XLkszDCIzslZCzb4USAdtjCwRIfHyTgQFL4UYQP10+0GCovTA4O8tykzpHhZz5ACGPEvxxLg+iJLm+4/jJ2vnUIAGaaumePS0AxalrdFIBc2eW48Sw/yEOHVanDXschxlItzymGSCnd81a0H64WeOlG+6yJvCjbOEOCSw2umb15T9h+BgzXkfIZJhw6jFRmKQYTzXId8v5lzPr9N9htPc/8CzqGGIv72s8vkqpHE7qqZlmoP7YcPh9ONwz+xhQjGPjlUTQtGAdSdEmSWHabfvESBTd3wg+Vseg+QPwXixFxrVapeno4EcarzLZJrfefdY63GRgFu82h27IU61I9ZY/ZlKoHeOkzTx5FR76PpB0p0hGtAGP6yaM6ucd6ZOpZupeAVCJugT/h7Bc4dGiWP8iyA0yVAR7h2bV/q0mxMTbXgfuL6Bb9e9taAmy7xPhWxxeQW7XfF1lP+8I7xTcXS7ml4E7NFBU+oEJeHDVeA7Y=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9165da2f-8aec-4ed7-a238-08db8dd7942e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 12:55:24.9031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldUOxp+XZZwdSCW8jzQle3pSSvhZypuPoDfoFM6p+BvOJo2XU0M6gjK1XLraEUQKEk/X1prozUTonSz4cNUWNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4964

Further changes will require access to the full RTE as a single value
in order to pass it to IOMMU interrupt remapping handlers.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Fix initializers.
---
Tested on gitlab CI, builds on all compilers used there.
---
 xen/arch/x86/include/asm/io_apic.h       | 57 +++++++++++++-----------
 xen/arch/x86/io_apic.c                   |  2 +-
 xen/drivers/passthrough/amd/iommu_intr.c |  4 +-
 xen/drivers/passthrough/vtd/intremap.c   |  4 +-
 4 files changed, 35 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index bd8cb95f46b1..4c4777b68a51 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -90,35 +90,38 @@ enum ioapic_irq_destination_types {
 };
 
 struct IO_APIC_route_entry {
-    unsigned int vector:8;
-    unsigned int delivery_mode:3; /*
-                                   * 000: FIXED
-                                   * 001: lowest prio
-                                   * 111: ExtINT
-                                   */
-    unsigned int dest_mode:1;     /* 0: physical, 1: logical */
-    unsigned int delivery_status:1;
-    unsigned int polarity:1;      /* 0: low, 1: high */
-    unsigned int irr:1;
-    unsigned int trigger:1;       /* 0: edge, 1: level */
-    unsigned int mask:1;          /* 0: enabled, 1: disabled */
-    unsigned int __reserved_2:15;
-
     union {
         struct {
-            unsigned int __reserved_1:24;
-            unsigned int physical_dest:4;
-            unsigned int __reserved_2:4;
-        } physical;
-
-        struct {
-            unsigned int __reserved_1:24;
-            unsigned int logical_dest:8;
-        } logical;
-
-        /* used when Interrupt Remapping with EIM is enabled */
-        unsigned int dest32;
-    } dest;
+            unsigned int vector:8;
+            unsigned int delivery_mode:3; /*
+                                           * 000: FIXED
+                                           * 001: lowest prio
+                                           * 111: ExtINT
+                                           */
+            unsigned int dest_mode:1;     /* 0: physical, 1: logical */
+            unsigned int delivery_status:1;
+            unsigned int polarity:1;      /* 0: low, 1: high */
+            unsigned int irr:1;
+            unsigned int trigger:1;       /* 0: edge, 1: level */
+            unsigned int mask:1;          /* 0: enabled, 1: disabled */
+            unsigned int __reserved_2:15;
+
+            union {
+                struct {
+                    unsigned int __reserved_1:24;
+                    unsigned int physical_dest:4;
+                    unsigned int __reserved_2:4;
+                } physical;
+
+                struct {
+                    unsigned int __reserved_1:24;
+                    unsigned int logical_dest:8;
+                } logical;
+                unsigned int dest32;
+            } dest;
+        };
+        uint64_t raw;
+    };
 };
 
 /*
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 25a08b1ea6c6..aada2ef96c62 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2360,7 +2360,7 @@ int ioapic_guest_read(unsigned long physbase, unsigned int reg, u32 *pval)
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
 {
     int apic, pin, irq, ret, pirq;
-    struct IO_APIC_route_entry rte = { 0 };
+    struct IO_APIC_route_entry rte = { };
     unsigned long flags;
     struct irq_desc *desc;
 
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index f4de09f43180..9e6be3be3515 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -352,8 +352,8 @@ static int update_intremap_entry_from_ioapic(
 void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int reg, unsigned int value)
 {
-    struct IO_APIC_route_entry old_rte = { 0 };
-    struct IO_APIC_route_entry new_rte = { 0 };
+    struct IO_APIC_route_entry old_rte = { };
+    struct IO_APIC_route_entry new_rte = { };
     unsigned int rte_lo = (reg & 1) ? reg - 1 : reg;
     unsigned int pin = (reg - 0x10) / 2;
     int seg, bdf, rc;
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index b39bc832821a..786388b4d9c7 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -419,7 +419,7 @@ unsigned int cf_check io_apic_read_remap_rte(
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
     int index;
-    struct IO_xAPIC_route_entry old_rte = { 0 };
+    struct IO_xAPIC_route_entry old_rte = { };
     int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
 
@@ -442,7 +442,7 @@ void cf_check io_apic_write_remap_rte(
     unsigned int apic, unsigned int reg, unsigned int value)
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
-    struct IO_xAPIC_route_entry old_rte = { 0 };
+    struct IO_xAPIC_route_entry old_rte = { };
     struct IO_APIC_route_remap_entry *remap_rte;
     unsigned int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
-- 
2.41.0


