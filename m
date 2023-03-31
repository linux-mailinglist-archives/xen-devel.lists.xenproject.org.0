Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72116D1D87
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 12:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516967.801923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYV-0001WC-Hg; Fri, 31 Mar 2023 10:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516967.801923; Fri, 31 Mar 2023 10:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYV-0001Ss-BW; Fri, 31 Mar 2023 10:00:23 +0000
Received: by outflank-mailman (input) for mailman id 516967;
 Fri, 31 Mar 2023 10:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTo5=7X=citrix.com=prvs=447f045ac=roger.pau@srs-se1.protection.inumbo.net>)
 id 1piBYT-0000wE-FL
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 10:00:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d53bc2a4-cfaa-11ed-b464-930f4c7d94ae;
 Fri, 31 Mar 2023 12:00:16 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2023 06:00:07 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5557.namprd03.prod.outlook.com (2603:10b6:5:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 10:00:05 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Fri, 31 Mar 2023
 10:00:05 +0000
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
X-Inumbo-ID: d53bc2a4-cfaa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680256816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lYj38XyWiQWsj/xF0BWs/BuiMegSu0fDwGfxzapWfb4=;
  b=XdEdfZvGUQV0oeiBoDHnXcEHr8AW3VdNljkPbDd2VM1nyu3/TznCQp6k
   0Pz1FygJ/I9ZPNSSnTmsOF/Ke7GqER1Mjq0QFJUHw4v81lBP/ZddVxvoF
   5aETbcvrpLpSaOLPlA9K8PYGTzGrOAAQZ5HFA/UGpBRbEB7YZY+X6+guk
   I=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 102606344
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0TQopaP1jG0qD57vrR23lsFynXyQoLVcMsEvi/4bfWQNrUorhGEHn
 2VKXjyBa/iNYmfxeY9xaIi3oxhTsJbSndYxSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5QVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rx5M1hsy
 +1JEQEyXgiNxLic246yTMA506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeOpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr22LeRxn+nMG4UPKS60L1zn1Sv+lFQAh4Xf2aZhNy6kkHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdHtbSUTTeW8e6SpDbrYCwNdzZdOGkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhF2bZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:lL8nLqvPPJ97VxMW7/7YC2QB7skDpdV00zEX/kB9WHVpm62j5r
 mTdZEgvyMc5wxwZJhNo6HmBEDiex3hHPxOkOws1N6ZNWGMhILCFvAH0WKN+UyHJ8Q8zIJgPG
 VbHpSWxOeeMXFKyeH9/Qm2E9wp3dmA97rAv5a8815dCSZtdqFu7w1wFwacFVczbw9bApA0UL
 qa6cwvnUvDRZ3fVKWGOkU=
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="102606344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igjDDLpU9rUeXuHFQN0gC7VKP+Mxmzg5imRcMyyrv6BFJ7pe2bKHOLDPiWaxs+x8sblVFXer9kgGHw+tMRpCl/Y69eW9ag7e8Zigha3wDbN1s5BJLOQ3eKuOX/9XK+Hg6dWk07/twjXl9f3MgkJzuYKqfFwfWGfGFFKuenBAOnOWEdwPiz52YqOROqncxVo8awomgApWihXiU5Tka+RBXTZ3N8F98fDEXi/zlWC9GwnKJ92fMtAfy2LWDYhsFjwj+DrjqFGko8OBkvCn1AZUqi9e/w5wFD1r51Yg9qLTOG6u2ttWt60X7OKSRB9sNcLocj7MqT7VDwSSlY3ZJa0VVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtEAq5Ug7QXlXwnPC+8yAaWQRyQAyZNLb8vOr9AL0ng=;
 b=f9EpS/0FNO9XokSp7TGJff8wMiufzZRq2aVO9Wu3fqjTeYGO7Keb04y5hfS/sPuWdTvzM1NipZCKgLhSGZAk0WQjNsRCWuz+60BXznNuPQJXvOL7DjS/6/4PVah2PxLsWB1TK02eyXipRN/x58+9a7La7g1Gl0PdezZj7nKrg6AEOB8HkpfGjN+3f1SP9qpqciNKRNYhZiFGgjmm88IdHrcF9P/TanzPAVuF7qTEt/huo7sxoYgxHT88dEjzXbAbT+NGkQeWop5z26oUJBX/f3QuOj7EDWPaqbqaJIunskZWBRAn6nZfV8d0N9M1CHSVb0TL2viRic1Pzply7y0Auw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtEAq5Ug7QXlXwnPC+8yAaWQRyQAyZNLb8vOr9AL0ng=;
 b=XqPGRGWQ5gjZq0yeO+pV5kaO8ur0v7qT+B3kzNVcmykiug+fC5VhqPzPNUufwrkqWYVX6BXVOIuCZFy8IfHbARpoDPJ/QL1E9fJTBHaYUVex7DPmlAIgDHmaarzrrz7H4Qax7OxeaGeS5E9wTMEnPG+UtGJc7UDiKHno3ynluC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/3] efi: try to use the currently set GOP mode
Date: Fri, 31 Mar 2023 11:59:44 +0200
Message-Id: <20230331095946.45024-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331095946.45024-1-roger.pau@citrix.com>
References: <20230331095946.45024-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0363.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 4648e4f9-f5e2-4994-af99-08db31ceb3f0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cIXg8mBMF5wDdBszW+QaDIsn8M8pvK7kR+/hWMIzsA2XrCbADcXno+RQ/DciTHdqWKBc17ezuMtQPi82i5LCAk3rtfNXx2KHiRrGz6QvXXRK5eUIe8QANj1nQrkwX6nn+xdBVQ4YIi1ougltgp6/EzAgXdE2iU6sHgpg/WXVJBDzAjb5PM4/blR+fXsX7QI1ugw7ar6mXefYTgSPnTH0HTGBzMUx8w46uiXp9s+pj1jMTobdwOvqVYJWFQ3FmQ7eQq6iTeznua/4N3/+xhYMR/Hydmz2Et1+2q3ibTltkNee/GTu7pav4xO3ju6Q3gmrPL2aIRmVbzz5//aU19XhMUvn4Bb6A5iwtAGZZDjQQECzmeDNI8h6YXtc7DaqzMK2L8kG0lo/dsgE7kQnmf2UOhHP0NRw852ea7RDUbTXIlJcPCG9e6pupnZCl57zgHl9LOgsFh7QBR5JP7HWyTAJeJboaZYss3VEf52hBUm8kc6qFegu016p6z5rMcH8xV9GB3K55NHO8kIhF+PVf1UpbdYc9CxhmnorEopdvugKj7Eofqynx1j5JutiaUKhPl8PR/LBPsPxlq01lcsFuy3L0zj70CuG8p6u0UIZsvJEPP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(478600001)(41300700001)(82960400001)(66556008)(66946007)(66476007)(83380400001)(2906002)(36756003)(54906003)(8676002)(316002)(4326008)(6512007)(86362001)(8936002)(186003)(26005)(6506007)(1076003)(6666004)(38100700002)(5660300002)(6916009)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3oxbWZLejF5WmZTc0pzS01JM0prLzR3WXhKZmorSnJzbTI2Uys3aG5WaDNE?=
 =?utf-8?B?NnRxSTZoQmhyNmVZT0M0TDlEY002UGMzVWpOcFRvenAwUHhhMXdXSVpTQ3hU?=
 =?utf-8?B?amhJblpKNUM5MmFWM05sYkFscitxNnVRWmxkOFQ2Y0N1V2NhN2VwRVlBRG5D?=
 =?utf-8?B?ajRrWUlnaVZMUUY4cUNuUDJxNkIxRHpwdlJVai9nOSt5NXZnOEE4NnBicEpW?=
 =?utf-8?B?K01mbHJrL0VObUUzckRHUTQvNGRrL3V5UmkzT0ZOcHdtRXVmRmxXVUtxL2hX?=
 =?utf-8?B?VE1zVFcxN3NyS3BKRWh4dEo3SzV2L1FRSTBpcmFtbUhlN05xRWlzQTNsaEJQ?=
 =?utf-8?B?VGZYY2VGc3c1Lzk1WkZmT2pTMWU2b0RNeTk3a01CYXZoMUtsK2xsK1RrWGpO?=
 =?utf-8?B?c0RJNi9zNUpVQ0x3MEk1SkpFN0NCVDRTT1FpcW9Uc3UyZHNNMUhTbGEyK0FU?=
 =?utf-8?B?dkJzeE04dzF5Vjc2RVZTZlNMd0o3QXNvTzNyNWJhNXRkL0dnSEpVS3ZtYmcx?=
 =?utf-8?B?NHFDbGZNVW5lZVNqZGliVlRtVlZCRFppZHNzUTJXWXh0WlV5YjZkaVF3Q3FL?=
 =?utf-8?B?M0VySGtHZjZadlM1cUIya084KzJuVEVLNXBFRE51VnBhTlNZVjRpeVdoL2NZ?=
 =?utf-8?B?QVZSZER1UlhrWjJnek93QUdnQnlCelRWWk54QmJVZ2xsMFBuMlFDVHo2SmVI?=
 =?utf-8?B?UEhBQmVGL3dsQUJ2Q2pjdGQwanZkOHpHRU9jUFhUV2hzRFVpRmNET3kxUHo5?=
 =?utf-8?B?NURVUloyUTI3VTZvT2NhT096Q1c5dXJ0blNieHROcnIrb29WcnF6YVI4ZjBm?=
 =?utf-8?B?RFNQUHJBcHNXZEZlSDhFVmdHaXBsZkhpcm9WMldiSzlydWFycjhrNkpTUmdY?=
 =?utf-8?B?VFMvTjc3UUs5T0xJTUs0QnpvTHByYW9kRDVTRGpnTG8wU01UZWdIN2ZBWllk?=
 =?utf-8?B?aEQ1ZlMyakNjRTJVd2Q2a09qV0pNNkxDTG5qNkIxQ0NqVWM4bDNYMnd6YjZU?=
 =?utf-8?B?d0t5amFGYk51Rkd2cVFOZmRJNFZhanRNTWo5ZWp4YnFKaW9YYjNJLzd0SHNF?=
 =?utf-8?B?MzQ0NFl2YXJVSTU4QndpaFpMcEZXY1RxUDZJc2JEM1F1UEFzR21IV1A1S0do?=
 =?utf-8?B?V0RHQ2hlc0tZVFQ0dTFMMjFwUmdPWGw0NndLbHVBYVkyUWFCVFNhUGNIZlRT?=
 =?utf-8?B?YjA2Sk52UWhPZFZYQ3VhMFcwcUpkQnF1bHh0ZXpCSE81V3hNMUlJdmZ5OWRt?=
 =?utf-8?B?R0g1WDFSQ2lEVlBTYkp0NlVLbllOUCs0a09jc2JXdU0vSy9HQlA5YUFrTDNE?=
 =?utf-8?B?T04zaEh6dGRBT0dmR21XTlByY0M4bEJzejd6UEdhMjZyYzZZVnpkaW11MS94?=
 =?utf-8?B?QVM3VUZYelNtbXNFOW9rbWFqSXZMS0w5ZDdVR0xYYld4MFZraWowOFp0R0Ry?=
 =?utf-8?B?L3lqR255aUUycWVza3REQWVhZGxqV1MzMHp3L0xXanBqSXp2RWxqcENNclhm?=
 =?utf-8?B?Q1dEc2xkOHdtbmd1YnJNTDFMb1kwd3hEZlZ2V2c5dFZIczJUZHZYbUdZaTZD?=
 =?utf-8?B?blQraHFPbTNLMUZGcFkzRGlLaDBPSnFLbTZUU1dlNXNuWldaSWxNekxFTlda?=
 =?utf-8?B?Q3EyTnNMU0hKRnExV0JaamFieXIxNHpoZWRhV2VPZzRuTFI3aEFPUENEMDdi?=
 =?utf-8?B?cHlrZlg4RW1hMWI0UHdtYUN6OHJLTHE3YmhiWjFDODJrYys0LzM5TnNuRitI?=
 =?utf-8?B?THBENGpiS1A0Z2loR2pWVE0xNkRIczlWN3dzU1QzVlQzREFqTlNFQnNkU1ZO?=
 =?utf-8?B?MHV3SjRCVld3OWdSNDQwb3RqcFFFRXpjUHI0U1NQYnMyR1BPbzIrMjdLeXpz?=
 =?utf-8?B?K1dvcmJwaVNmV29HZm92dW1penhteDd1R3hVTWwzbU02dHJWcWQycDB0WEpx?=
 =?utf-8?B?WndISW12K1RSQkRxcHI3NDRVM3hqTURYb2pQeHY2eHVINi9SU2xTUTd1TXhL?=
 =?utf-8?B?ZjdqMkMzKzIzOEU5WGVpQW0yeWhZYUdIMlV2REpGNmR3SEtXL2Y0VmhMTDdi?=
 =?utf-8?B?YTVOOTdVdzdOQk55NGIyVG9OUEk2OUNCWHRCbGptRzRxZURtQ2lqMlZLTTBy?=
 =?utf-8?Q?sBpHxniEANujPhf8KPXazuT99?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Es0Ljvs6tzutq4DzvVyXT7iFmMxp4RRmnNKZl9XFD4Ea7trIDoK1J1o8JTHf+0Tpg0IAUS3DiFF9WwpLTMsufy3Ln0jdRqR4Vh2MSjilY6UC89xogmYQyD5Hc84fIe6nGGC9iBRT0mNhLLM/JoRXYGg34QO7NkeBus1YxFjRnXgx5aii2FqvPlOAg+U+eOQn5rlaBeru9jLEYXDAwmYsQEocsFwqaSDsXUe019VLiYic8ejqeCkol79CI2GglBcZWK4suLrW8PYuVJZa8yBR2BRwcyWsQ/vhDPIHr7KRFzEOeOdVCAO8z0E8RoddDNICSBV2XMjdVYFbJIEw9b5wFeeRx+0BC//RVJZFwPdD+sTdqQ1+Br+B8wvKiJWkqlKa25zuOyZRvk04AnCaPA87BNhwLuMpux+UKAV7XHB29OtA8Bl6xDcttodzV+Ei9I3J9A0m1/qTPsYBV1kn/wUisMbmdJcUU0tIAS0+YemQjmIQ/Lo76uslACTvZIwX9czQjqaSKHcFDFuO+n11pPxbR9d6CvcRsq9ZHaF5A0KTwrYq6jIwLxQh8wnumeS7oQgs7wktUF9XUOLa1qkcAP2KbkYs9vuNaPyzF7zj10S58UyQcylNK8pMY/U5SRETn73eTC7ux1GZLXbc824JJaOigtUkf53Q9V1l9IJ4bXnc25MfZGEwxweouPmfpBYaxTcqX7Gehstlyv2QHvZ6VVINp6364kP+1Deq9LvsQUIUXRILQJhXLNLSrhFRf1SsGPOvdHvMemjGCya9vq1OzXFmu7MqVrmqNfiYoRsA2/rlkhf1hGbch8yvqM3n2q7Czf0W
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4648e4f9-f5e2-4994-af99-08db31ceb3f0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 10:00:05.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RiHCddHh7SWdxVnnQM6KY3tBdGd7aTtWj9jYHERjV/IsInWUHiM3gVCOJV1K0RPiGM4VNZ1fEbydP1P7JrXDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5557

Modify efi_find_gop_mode() so that passing cols or rows as 0 is
interpreted as a request to attempt to keep the currently set mode,
and do so if the mode query for information is successful and the depth
is supported.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Only update cols or rows if the value is 0.
 - Leave depth alone.
---
 xen/common/efi/boot.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b69c83e354..766a2553be 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -930,6 +930,27 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
     UINTN gop_mode = ~0, info_size, size;
     unsigned int i;
 
+    if ( (!cols || !rows) && gop->Mode->Mode < gop->Mode->MaxMode )
+    {
+        /* If no (valid) resolution suggested, try to use the current mode. */
+        status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
+        if ( EFI_ERROR(status) )
+            PrintErr(L"Invalid current graphics mode\r\n");
+        else if ( mode_info->PixelFormat < PixelBltOnly )
+            return gop->Mode->Mode;
+        else
+        {
+            /*
+             * Try to find a mode with the same resolution and a valid pixel
+             * format.
+             */
+            if ( !cols )
+                cols = mode_info->HorizontalResolution;
+            if ( !rows )
+                rows = mode_info->VerticalResolution;
+        }
+    }
+
     for ( i = size = 0; i < gop->Mode->MaxMode; ++i )
     {
         unsigned int bpp = 0;
-- 
2.40.0


