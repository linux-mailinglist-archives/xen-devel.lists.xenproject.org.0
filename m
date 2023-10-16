Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F17CAC42
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617685.960528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOwh-0008KS-2b; Mon, 16 Oct 2023 14:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617685.960528; Mon, 16 Oct 2023 14:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOwg-0008IX-VR; Mon, 16 Oct 2023 14:51:50 +0000
Received: by outflank-mailman (input) for mailman id 617685;
 Mon, 16 Oct 2023 14:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsOwe-0008IR-TM
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:51:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 865f97a2-6c33-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:51:46 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 10:51:43 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by DM6PR03MB5100.namprd03.prod.outlook.com (2603:10b6:5:1e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 14:51:41 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 14:51:41 +0000
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
X-Inumbo-ID: 865f97a2-6c33-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697467906;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xgj6J06Pwq7rKvDP1eiZOC17hB7Nwo9H8V4eZF+GVF8=;
  b=VIQU92lVEYq8KY6nUr6X/sjbcDijO30vo0YdsPCscU8uS7MSHwYUKazZ
   ZXwqeh/JKUnTICWWYBKYAJfG3MCoRETdnD4mQg2o1b2DJfEUqbiRRrjTI
   xHOlappdmVuTnIjY5WEJ9QOq18RbQIGDgqWPOnbBOEcMsT95yMywF0B0i
   4=;
X-CSE-ConnectionGUID: VfPlr+NCQQiHHSKkY2NeBQ==
X-CSE-MsgGUID: m1lX2Di7TQCRoE6KennhmQ==
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 126148978
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:feG0baDgDZhWihVW/+niw5YqxClBgxIJ4kV8jS/XYbTApDwg0jwDx
 2NMD2vXOPiIYmHwLtogPtmw8UMFusfTmNEwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtB4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxOhPBXsN0
 9chETEtTiughNPs5r+Rc7w57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCz12r+ewnOTtIQ6EeS8xqRGgQKv/0cpDzBIdla9p/m8sxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4M+A88hDL9aPS7C6QHG1CRTlEAPQ5sOcmSDps0
 UWG9/vxDCFrmK2YTzSa7Lj8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXI9SrYx
 jmLqG00geUVhMtSjqGjpwmZ0nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:Ao3FoaM42G3soMBcTvujsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICO8qTNWftWLdyQiVxe9ZnOzf6gylNyri9vNMkY
 dMGpIObuEY1GIK6PoSNjPId+od/A==
X-Talos-CUID: 9a23:YWjN52G82ejhmp0eqmJZ+nYQAIMDWUTkzVfwGGy7ODxPRZesHAo=
X-Talos-MUID: 9a23:Zaf00Qum5a4dmE4EUM2ngWhmBJ1E4vuSMWs3lrhYmMSCMyx1AmLI
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="126148978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJc63Litq7Xx+4MKOmJyRGWfXHb/XNG//Jt326EFL7wu+VYovIPyS+sidxfw9zf+h1C+H9FWe6oK1x6A0ihVwiQM0GDIHWcu9ywqjwTJLf1/xqf9H0gn0U4aSfq/VM+Z1ddt30M5e2H+bFTQ0e8XdsHCUMj0J6I+Pq0LM9JfGjreHDw9D/JI9G042G3Pc0dINL0vREtIDWYHffUNCkzRLlWBUpyh6uZfS1HGujqbKC6nfR+f58tLCiVbs3nfrDThONT+vM6oj4XCXw8eSZmX32pqMvb33KN3niM54yJzsOXJdw8hFBVszOUOBy+O6Gx8HayhTk2UOdhm1jUifVpMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2Bl8+R+zQ9Oc93xbqXDApgOEMu2IKkIH1S+p0mCo88=;
 b=UfIEG/yH0raLJPcEqjqZqR73WIwxCPc548uK0kOltyHtohE1QkJFKdUha5L+cFduGuRy+GKw/cztOdN5UkZBBe3w0oiS8DbdCumgOoW6FUXvU3s5zznMOtm+01hZGEGdwTCg28IuOQ2YFxbiuOlaD/dELHHqlrV8/VEHFX565oxlQ7U5fVf59lYevEX1zjxKYPdNUj/pb/lXMG16wexHOsqAR7XaquJurs6yvzq5VcMawZH5PO81jZjvIGdR87q/pilQ+5ktSYykzHwXaHH3vhWGYRI8U+iq/CzhfeQAXp7ku5pDZalmwEQQ1Mv/JF10lvyMhlV3HNJxRL8Jr/tOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2Bl8+R+zQ9Oc93xbqXDApgOEMu2IKkIH1S+p0mCo88=;
 b=hkU7fWbXvMj1fYsgcH67IaBQ4kALXAqqSoi4VMX4hP05jG9HskZ1l4tMBsadYrU1VDN7SDbJYWYTqy20wevKXKnb0L3iCG10WxODfWb4963jBdKY7m8DN5lCRMwZHP/ZQzJsygu1GRH9uy1OTFb2hphZJw2L+svdKrzyk12CWd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 16:51:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Message-ID: <ZS1N9wZ05ebun3WJ@macbook>
References: <20231013085654.2789-1-roger.pau@citrix.com>
 <9aaae72b-fdcc-b48b-1155-e1cb0401d7d1@suse.com>
 <ZS0_zPxGLwfsuVvX@macbook>
 <879e6934-93b3-e260-770a-966cf8bcd2f8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <879e6934-93b3-e260-770a-966cf8bcd2f8@suse.com>
X-ClientProxiedBy: LO6P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::14) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|DM6PR03MB5100:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f84ae87-b628-4a6f-f398-08dbce576834
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2UFJooOuoYIywsyLzbrw+I7dPEnQR1/5no3IUvo+LiJgmPPGHb3RUn2TZavTbKgLbQCwphIn6/guUCVRUG0JCfzGUCak32oNHvnhdvnANNmiPdTipvqyAkzYPkSGsMTtaBNYecIZv+Yo0h72VfLz0f1yPbsYlfyS8FFbO9mvQMbk22IfKL5hlsJi0mFXhyWWFPn2iylxqBV3+Fca3Tjkp6c4B74gvFtoU7VJYeq73mQSS8yig7I5X6tblUi4dOdOoR1H98wplZwq7RvouSqx7PDLeQPWN0I6NDAKC/5kysoLFPw2XGBY4zUfUUs/wkVpNOhd5/Fb/gsvbGopN6KzNSrJHj3BxS7QfkEFkMbNiaQjxBOf58zF24P8rhDagzkvgOyBoALFHVKyQwwJXo91yj3YBMQ1c29fL1iHRDhdA80jjSL8x6sQDc41Fb/qp2qqFriWKmBUrh3ZH1xoX6qBufBwGOXXygAUu2+DciPsHo9ohuffJ+x2X5FuMayN3zeJW4mDsB8V/6kpDLhh3L6EDHX2VLvTsJMX6pbXl/iTIO95DtriHVW0mR+iDWTe6IOs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(85182001)(6486002)(33716001)(2906002)(478600001)(9686003)(41300700001)(5660300002)(6506007)(82960400001)(38100700002)(53546011)(26005)(66946007)(54906003)(8936002)(6666004)(66476007)(6916009)(316002)(66556008)(8676002)(4326008)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VElqVnlrUGNsY1p6TTYwWFAxMWpBd1JwK2pHaGpsSW5sSnp1MXcwa2hVMlBQ?=
 =?utf-8?B?aWFjYUQvRnZjc0tZaGhkM2RuSDJWdnM0aWNYby9DTE5QRzJhQW1jc1k0K1FC?=
 =?utf-8?B?NnU1RFpueExLTmxqdlpNbkVFa3lCbktrSHBINmNjYktYejhQYy9JS05sNlZ2?=
 =?utf-8?B?ckhwOGdRdEdHTzd3RkZVTEtJTmhZWi9TTWYwM0VGaHZnVC9LeXo0M2Z1U080?=
 =?utf-8?B?dGFPT2xaN1hGSmxRa0NpUWxWMXI3RDBSRWtiMStYSEhKUzZ2Sm0wOWNwMHhO?=
 =?utf-8?B?U1oyVXJXd0wyMTdTdjZMMjJmTUZnRktpNGZCRE1CUnk3WjBwcEJsY0dLZ2U5?=
 =?utf-8?B?T2R5bmg5aUowL3l4WmFRamRqZWNWSTU0RjI1U3VkcHBhL2FSWkUzUUJWQVRC?=
 =?utf-8?B?bXJ0SGZ6eGR1clJhb25MZE9TZTgzSHZlVWdrMGtvNjRhVzd6SXpPM0RRanVs?=
 =?utf-8?B?Rjl2ZEl1a1lpa0pyOHBkcVNCOVhYUDdJbkp2akN5c2d1OU1CMkRqblZFMlRB?=
 =?utf-8?B?akVTYkkrWmduQ1preERUOHZiTHovQzB6Tlg4QzFDWGhyVEl6VDg0TzZRYlMr?=
 =?utf-8?B?MkUwcHFuR014MWg3WG1ONHJrbDN3MnFsV0h5bHkzUE8xZ0E4bnJQUkdXV1lp?=
 =?utf-8?B?RlVJVHBCZEZDeVkvZkw1N1cvcGZwa2ltOERlT09FVTNDNmtRZW1BQ0djVkdS?=
 =?utf-8?B?WmxLajZxL3NDcXhJY0FPbWVWdjY4RGJLRUFLSkIvQVBJTVJCWUc2WVpVcTdx?=
 =?utf-8?B?empWZEdVK1ZhN1ptOEZLRGhWY1VJRWt6YTMwa1VxTEtWYlJzQ2lwb3l6OHdE?=
 =?utf-8?B?WjZad1FjYldVa0lvNmVTdkJVSG5IZnZmWUMwMEtENlJtNmVXMldKN0pOOEg0?=
 =?utf-8?B?bmRrRG9PRldGTDJVU0ltdXFROVM0bUhJaGpqNkpYbXFQdXFtR0JkNHlPdERu?=
 =?utf-8?B?WVBmbHIxUjFuWXBNRzQ5T1RVSWFNM0Npc0pkeFM0MXUrNGdQNzQyakxzdTJs?=
 =?utf-8?B?OUNMaFJ0L2QzYWN6U3pKRkZpWlJJbnBUR3VVQXA0VlMvU2Y2WlRnelVMMUhv?=
 =?utf-8?B?Mklwb0sxRjNMWG5MUWVwdXRLbkFvcWhnaFA2TXRvMVdQWDlLWXBZR05zUDd2?=
 =?utf-8?B?QkNQWHR5K0xDMG9HL2VKZkJKYlBtQkh2Y21KRGlYWjVDbDE2ODVMMDhMWnNJ?=
 =?utf-8?B?Z3ZMN3g0allmQ0RmZVRLQUhSYjQyejF2S1ZyUWN4RWw0T1pGYTdDc0tTMlRC?=
 =?utf-8?B?eTFNRHRqTkJEMUtTTkF3TTdORUNUbW43c0w1YjduT0YzeC96Tlp1VlhyZndQ?=
 =?utf-8?B?cmtoYUIxUXdGTlBKNDUxbWVSY3l1SzQyZkFXeHM1MmFJTnJlQ2paOTR1amY2?=
 =?utf-8?B?N2lJMTUzNlF2LzNhZFIyamZmS0hKK1c4aXU4OHdzYk5FUHl3TmkzK2dhVUM3?=
 =?utf-8?B?QWZoWFFzTFMwOWlzZk1aQVg1RnZqWU05bWIrcVduZ3dSNTNVdW16U1VUcWdK?=
 =?utf-8?B?b1lCNG81RkxIL0NybFBWempINlBDc3JiZkJyd0srS0pnZkt6eCtidEJ2SmNw?=
 =?utf-8?B?blBNOUlUOUpwK05FS1I2WVFRQ1ZLa1JFYmdESG51WVhHRnA5RlZMd25DK2xs?=
 =?utf-8?B?UFRKY2JxMDVrSU5iK0FrNkROWVNJMWZSWStQZCtWUVVvNmpSeHB5UUI0L3Y5?=
 =?utf-8?B?RXV6UTRQQVBoWXRJMEFWLzR4Y1BMOUlkVDBzV3NEU0hQd1k3ekd2cXdFWW10?=
 =?utf-8?B?Z2FNZkNqSWxsd1RWVWUxYzhMaTVvNXEzcU9ONUpJMmFkbE5aYkM4Y1NBeHhh?=
 =?utf-8?B?NmE0bWI3bUtWS2l5VnBuaEQrVFBlRlJoaXJmLzkzT1d1Vmg3NXgzWnVUMGpy?=
 =?utf-8?B?d0tjWW9SSWNodW5uOGJBZXV3NUl6ckpDdWZTMTB6UWZqY1ZxTGF1YnE3OGZH?=
 =?utf-8?B?eTJ1NUNUNy8zejdZSG9yb3NZVVpmMGJXOTRxWmpLRFRvVGpaSGZhdHZmTUIy?=
 =?utf-8?B?REhJeU9SdUNxVU12aWxmRCtLSXpGSUVXM1NCR0lSeFRzQmxuSVRhQlRuS1Rk?=
 =?utf-8?B?N3EvSEc0Nmhvc3o4WW05eHE5MXBGRTVINHpZWjY2NXRTSU12Wmp3YVN1MzRN?=
 =?utf-8?B?c0RFVndwckJDOVNyb1YzR1N2T0IyNktXZlNIeTJrRWVrSGRJVXJZMUp6VzVN?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I+SGuFblaGenKsk+2VRAv9fcp8f3TJ7DIwMJp1y9uUVbG9t5EWMP9bfiLxO5ARd/7tcxMVdMW0CruN/AE8Q63929KZ5Puulf6liNviyJRTJUgrLE1xV2BV3DZLOP5+b31jL9P4B+xl30izjoEjmDI+n7aulJs4HrmOwLHmHzyLuB3TQ3y4iNReMQU7wFLSe/EdFvpUhOw+nuKAWDp2B8a+FxO9pYySql+JCGROdeJjKB4zCOj9YBOhOAy05j+N3gGkcvsJuxpt8Vc+ImYgmCC7ti5YfNQWGpjQzwU60finn0Otn2Pbs5t97mPIdAb6aN3XgALi/DfDFxolpyiPT/RSjOJcG5x56173KOpx0bWPl4YfoR92PFB2j42C0ck7GG64OO/zp0qohcJr0xbNECkTJ5bd9CvGMJqKFC95o//CHohRPDWZWhrylRUhqECoGb4W7VP8cqWsI92CK8MzA6v049MJkuEpDlIa32HrOS1MUpMqdnfNgFrGJ8huDyozfTekyn0lbsK/TVyLwnlruI8tF9CwQfd5Cu9AZ03X2htyaBstXHKsbekxfHfxOThuNl4xaT9DCQ9DE3XSNw6aytdoQgLjuWpfriQQFgsc4YLThAGQAfPzXagdtGmcMoelxPV3CxoBKHg3ljqPvP14MIxIxWYUm8oZA7pLWymn+TzPZ6/8NH8HUWrex5tw+JU9sHi/eb7b8EFu2cIzFspnvNuNqid1RSDg5+IeyIaHZV8gcop/93tu+HLYWBhOOH7GyyUsFbBV7cydSELHg8NvL849iDhrf2D/4XeVBrS++7tNnKmP9G0SSq6++joGU8H8vB6/U06cnJOXXwUOSatLPTjleL3lVCkYPTPrQf+975cVU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f84ae87-b628-4a6f-f398-08dbce576834
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:51:40.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jUt/B2jLo+vDzE5Tk5njd7R4ztodPhVPmifJFskwYJ64jWvqaUs3sZz2F5+5x+SRyIQyGImgKG14VhDckGD6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5100

On Mon, Oct 16, 2023 at 04:07:22PM +0200, Jan Beulich wrote:
> On 16.10.2023 15:51, Roger Pau Monné wrote:
> > On Mon, Oct 16, 2023 at 03:32:54PM +0200, Jan Beulich wrote:
> >> On 13.10.2023 10:56, Roger Pau Monne wrote:
> >>> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> >>> builder code, causing the region to be avoided by the arch specific IOMMU
> >>> hardware domain initialization code.  That lead to the IOMMU being enabled
> >>> without reserved regions in the low 1MB identity mapped in the p2m for PVH
> >>> hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
> >>> describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
> >>> faults until the p2m is populated by the PVH dom0 builder:
> >>>
> >>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> >>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> >>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> >>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> >>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> >>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> >>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
> >>>
> >>> Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
> >>> Opteron(tm) Processor 3350 HE).
> >>>
> >>> Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
> >>> leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
> >>> arch init code to create any identity mappings for reserved regions in that
> >>> range (like it already does for reserved regions elsewhere).
> >>>
> >>> Note there's a small difference in behavior, as holes in the low 1MB will no
> >>> longer be identity mapped to the p2m.
> >>
> >> I certainly like the simplification, but I'm concerned by this: The BDA
> >> is not normally reserved, yet may want accessing by Dom0 (to see the real
> >> machine contents). We do access that first page of memory ourselves, so
> >> I expect OSes may do so as well (even if the specific aspect I'm thinking
> >> of - the warm/cold reboot field - is under Xen's control).
> > 
> > The BDA on the systems I've checked falls into a RAM area on the
> > memory map, but if you think it can be problematic I could arrange for
> > arch_iommu_hwdom_init() to also identity map holes in the low 1MB.
> 
> Hmm, this again is a case where I'd wish CPU and IOMMU mappings could
> be different. I don't see reasons to try I/O to such holes, but I can
> see reasons for CPU accesses (of more or less probing kind).

Hm, while I agree devices have likely no reason to access holes (there
or elsewhere) I don't see much benefit of having this differentiation,
it's easier to just map everything for accesses from both device and
CPU rather than us having to decide (and maybe get wrong) whether
ranges should only be accessed by the CPU.

> > Keep in mind this is only for PVH, it won't affect PV.
> 
> Of course.

Would you be willing to Ack it?

Thanks, Roger.

