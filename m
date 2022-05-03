Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4885180C6
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 11:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319329.539539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlocs-0002lp-6F; Tue, 03 May 2022 09:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319329.539539; Tue, 03 May 2022 09:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlocs-0002ie-2J; Tue, 03 May 2022 09:15:22 +0000
Received: by outflank-mailman (input) for mailman id 319329;
 Tue, 03 May 2022 09:15:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlocq-0002iY-Gz
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 09:15:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bcb3625-cac1-11ec-a406-831a346695d4;
 Tue, 03 May 2022 11:15:18 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 05:15:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO2PR03MB2408.namprd03.prod.outlook.com (2603:10b6:102:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Tue, 3 May
 2022 09:15:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 09:15:11 +0000
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
X-Inumbo-ID: 8bcb3625-cac1-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651569318;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RxYtBFuVdI9iiBeYUXijMWz3ziAJd0J2gaMlQP0zwUE=;
  b=KwIScIy3dzeYqz2oRshM8Kbp5PgmHr84FYUHGUcUWiXmtUNtwngjQ22c
   5GYZf6KwMNvZANiGFSsppUN1l55gpAimfB7Pad4LV8aDGgg/rtkhRk5il
   cSikzX30mxuiWywaBdhSDfrWw1lcj6xoLfapnoM1DC4msoRuEoumpmZQ1
   g=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 70326970
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GVGaAqLrWQJyV2bQFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENS1GFVz
 mAcUG7QPPmCZGHxco9+bNyw9EJXv5HVzdE3TQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Yz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NZpm62aUhxqBfLVx9wRDT1/GnxQAoQTrdcrIVDn2SCS52vvViK2ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM2FGvubjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SGkKWMJ9wr9Sawf+EyM0VF+wKHREvnRUMWNS/10s2Dfq
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPJVGuw+rQuLmqzd5l/DAnBeF2AQLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:b9RhAKjvNb8asZZZdZiYohsgwHBQX1N13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeSWCQfkNIN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 D52+pT5fVzp/QtHNNA7dc6MLWK41P2MGLx2UKpUCLa/fI8SjvwQ6Ce2sRG2MiaPLo18bAVpL
 PtFHtliE9aQTOaNSTJ5uwHzizw
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70326970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsM0wsywgqOgJIuc+wsrDUuzO2UhoEPG4TEX9s5kk5nm+6KpOSIFOqdpmjDv+fJmgX8+CJ6jdcQ9dC1Jm8ZBsFee9dBcVq7mXOqcv+yL3GuLORiDjt8vz5UijW018NR5SxIX5vvTBCieShUQRdMRVu9oCRubL1kVDIRBdLGps4n77GNzYAETdvYE0xAMQR5qiao1JhgI8zqzxeBBncDwUYhJZ24ooOXVeLoD4gYA2M5vhhRC9EU3Aufzqng/9saakxpTxk539xWVICXaeJxE/qfTV5p6+T0CoviKpjrje9qVsqPs07coCqUdqbbR/jkOE/plgz4XGYaqaXMX77SWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU3lfkaVuRNiVoZVgnR/BzYCqQvkfqCtqROFVEbSrUQ=;
 b=KZsn2pUiH3607hp7oEYDaBUFF5/7NOtvDAl/kPjh1IF0edj8qyR+IFcsiLFCHx4kvu6F6gK0J8FX2n4AbSLIxSMC60pwEvPRe4SI5yogJeKv3n3jgHGj90eDU9wnSMCDfwErURRjn76obeur3Nj9R9DO8VpNeuSCKAkPtsyewW1yYrPC8e+1DFj/4lP35tna1e0alJIOibbKnp6VVvBDP/VOVRvFDiMU9Zyw8qKQ2cXRUoj1dnDnX2c+7BfblvFklCVpfFY23L97/ETcS9i9Oc/S9H4XiYBMaKkgxsuKWB2fAS2sT15xi06KQa3F5cVppQNAx5iy0SZHe8uT9S9sjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU3lfkaVuRNiVoZVgnR/BzYCqQvkfqCtqROFVEbSrUQ=;
 b=NkAo4ihnJR67wr1Z5c/i1SGRd9abn4Gi15LpIHYyK996bVdOp9X59V6A+1chZukAxkvYXOdBVity4EzAp45RTttROm+83zMFVNrTb2mdqbhFp/S82CD1Kcg+8FlQQJigavhoY1dhnuszHUQIEAk/1rYidhZciR9bixZBP4pg1L0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 11:15:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC] x86/lld: fix symbol map generation
Message-ID: <YnDyluwoiux73pqV@Air-de-Roger>
References: <20220502152020.19768-1-roger.pau@citrix.com>
 <a8313955-98ff-d941-00a4-c5e318761c67@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8313955-98ff-d941-00a4-c5e318761c67@suse.com>
X-ClientProxiedBy: MR1P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e38ba403-1af7-45aa-efd5-08da2ce56d28
X-MS-TrafficTypeDiagnostic: CO2PR03MB2408:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<CO2PR03MB24087F7400BC642D133849778FC09@CO2PR03MB2408.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x/BgmoWWb1oURRY0u9afxdzdi4jD2MyaEEPjgzZzvqwXWJy5H0jNc+OWtlJa+15gtK3CCncC1gdo8s3W/WhvjEXQOmsIuOT1KQeh61+or7e2VBImuHDgXAs8WffNCS/2/FDwwgHXdlZeUhQd1Zth+XC91SkWUaTonwIi27FMAFVWP1mkCfuGKKDzOOGQ6Ivpiq+hAJzMyK/6QwGZ+Q14ewoAkCMpcYvhefU3FBI5kQd3pSjXZ8/vEjrGZ0WVttpVZLQ/MYLZcie4t/FjYzhSPg8Yz4O2zrS6o2jpgLTYOJ/j2JpeBpTS+XT9Nd3n+e72u+LOoUplXnITHTN1hRlyTQC8eMljkEIL4rKAqgtd8iuFx6UWDVakY8DxUmtnBKQ29DWgIWZ7JOPhA5Sdsho69rYPavruxL4HY07g4fPnZ9dtK60ESqEd2JOpiDg9FGscac1R2R/cBPy6orkMAXY8eslxUTRnKS3RKOV1KzDdXN9tqwWIk4TXEa2ZEoZnCA1FgYUkcDsG+T8dwCOJZuXfuhsKum6tDOOCOol0EC15Tjj6L+PkrgdeOEQg2KJXddEQgwB2iafa9albrPGbGJDVLf2wifiRmKSQgXiTAT66mvzSq3bBluo0/ex/nkBZugA+wx3dwdd40ZbSSE2mUAkGYs84ZgeWtVcBNFBBOYYoHT6wODvF7FbQoaZE7D7vlaH8dGkBUhOchQwVrTrdGtrT4ZR+dUvOb3aVQZOcz7gVPoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(316002)(966005)(83380400001)(6916009)(5660300002)(85182001)(8936002)(2906002)(33716001)(86362001)(53546011)(82960400001)(66946007)(508600001)(186003)(6486002)(66556008)(38100700002)(66476007)(8676002)(26005)(6506007)(4326008)(9686003)(6666004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V080QjBONk1hU1ViRUJLWmI1NXdYVlh0UUEwZnJtZ3graXhPbXFWOFN6Z0tU?=
 =?utf-8?B?a1NwQ3ZNakZzTW5Fekd3Yk8vZDZpa3NTSTJnSVlQdjd1dklaZlJEQnlpWXJR?=
 =?utf-8?B?NXJwenQ4UXo1UmwwM2FDdlFaNEZINVVoeE9OeHVlb3ZwZWVtVHhGTFFwOEN2?=
 =?utf-8?B?dWE0aXEzTTg2UndpVFNURE5yRERpOGVQZ2tjYUFja1lBbC9xOGtLYkF0OEI4?=
 =?utf-8?B?Sk4rbDNZYU1ZSGl5OGlaaHVmbnVIQVZ5OVhWU0FOODFjVXpjRWZkRjVuS1dV?=
 =?utf-8?B?OTU1R2tyWmw5SDhmV292a3l0UnlYTE1SeEh0TXBxRTJNbGZQN1laQlRZTWpH?=
 =?utf-8?B?T0xzVDNXeGtyT216Wk1RWUZPOU4ranJybXBialRJcEdXK2laVGdMMGNTRUdl?=
 =?utf-8?B?UmFDcHY0SkdPdGg0WnVqM1cwRytldGUvbzNOUFRkZHp2RmJ6OXFkYWNzK0FK?=
 =?utf-8?B?WTVpdHBqN3hlVzZweGxPcGFETTRkbDRqWFJGb2ROaDdncTNrTEdoT1VMQnlL?=
 =?utf-8?B?cTVhb1JCYjY1dUJYUFhtdGtXM3RLSHMvQWZBc1ZxVWY0NWdUdFBma25KbE1y?=
 =?utf-8?B?czFFTklnQks3RGROM2RlaURoN2g5VzdaTUJHRVdYc05NcXBpZFM3Q3BoVkxS?=
 =?utf-8?B?S25MWE5iOEJSZENwYktqQjVpdjNWYUUybGlocXA5MjRPc1RkY3VaV0dWc3NX?=
 =?utf-8?B?ZE5aN29FNXBhYjV6djBBa0w3bk55VmVUS3o4U2RYWmM4Mkx6MDBNYUhFS3hr?=
 =?utf-8?B?ZzJRVExCM1I1SE95dlFkQVFLV2NjL0dRWFluSWwrSS95L3Zia0c4Q0h4ckc3?=
 =?utf-8?B?UDFtQ2FwaFl2QUUxV2tOakJuaUpiZVhoZnNQVVFZcVRDMk12enBJMUVNQTB4?=
 =?utf-8?B?WW1oZnlDU2VadWVidkxmRG9sbWlydllhcmZJb1dnVjNSTXQyWnN3akNVSFBY?=
 =?utf-8?B?YjVSeDBaNHVyWVo1R0pteDF4WlJqZzR0S0VabXBYY0JnTFRkWnlTNk50cTBz?=
 =?utf-8?B?cVpqVGYwZ2R1aUQ1T001T1RmOEpWRUxNUk0xb0xzMkw5SXB6RmxzUmE0clJO?=
 =?utf-8?B?U3BZU3BXWVFVdWlCVy9hZlhjblYvSEJIVVZwS0VhN2pDMkFiM1QxbFgza1Bl?=
 =?utf-8?B?ZjZBejAzTWRmbjRBZHdvWUozS0YrQ3hUOXZ1TTh4U1h4U0E2MDRvQmpBRnpR?=
 =?utf-8?B?VUtVVTh4ZnFHWE5ORW1hRjc0bFRac1k0REZVREZvMEloK3cvNFpDMDNjbzBu?=
 =?utf-8?B?dmpYRHFCUmdZLzJ4T21nM1p1czVkVk1LK3JkUEMxM3ZqMnpwUWt6UFNWemtJ?=
 =?utf-8?B?VFBYRys0L3VHblVuOVJsa0VqV1BkQ3NqSmhkN3VXWWx5dVFaajIyenhlVk5F?=
 =?utf-8?B?ZjVuUkN2Y2ZJczc5WTY4ZEhTOUl6dHUyVWYweUlmajRMcno0WnVkbHpPbGwr?=
 =?utf-8?B?aHVRTVY1Y0tZK2RKaEtpSW9aR1pudnB2bTA4ZSthYWVSTWNLWC9wVmt0Tlk2?=
 =?utf-8?B?UlpoVzlkUzU2R05EWGVVR3hvU2xmMWlKcU1JbmpiUFJGcElYZXRTSW1kYTBn?=
 =?utf-8?B?WG95ZWFWaURKWGQxQWxlZXhNTnFJS21XYXJyOHBBdmhQV1I0STZ0S1RmK0Fy?=
 =?utf-8?B?MmlSSzFGYlh3cTdhckc1NGJVV3BQNzB6VVJ3UEJPaHUvVTZYZFprbjdMeEhN?=
 =?utf-8?B?RVpkaUZsWllPdk1QdzhUQkhLTVM1bHBYcXlUOCtZUU1ad3lvR0dkeDZaaFNN?=
 =?utf-8?B?bWNtb2JaTmkvUFIwL2FHQWlHV2hKN0VnTldHSnlleWppbmR2QzEyc3hMMDdY?=
 =?utf-8?B?K25lTUphcnRvUjBwdDNoN29ZekdYNFJHOXJDd2RYNDdaTkRDRzRod1FDWjdv?=
 =?utf-8?B?RldTUWEwOUlrQllZNWg0THhoalNVM2FTdkFoQUJsY0NZaHBTVmF4cDV3ZGkz?=
 =?utf-8?B?eUViR041c2I4T0hFc0FHUEtFeDN0a1hoNGFYcSt5ZHZZRXcxRUZoMjNBdTJh?=
 =?utf-8?B?TEhsbUlycStOSGRTVi9OUHVtZ2tSSHRPUGdZSDhzVVJaSDhlOHBVd0gvVXU1?=
 =?utf-8?B?MlM5VEdRMXllVTRJOFRCak9xWnliUzhVaitCRWxML0Rzck1hSXZjOWRVY2E3?=
 =?utf-8?B?Q2FyK01QZURuL0ZpSW5OWHMyQmVaSkZKUTlITjFNTkpDbUhQbDhmN0VxKyti?=
 =?utf-8?B?eThPRlpaM21QOG5Rbnd5MHk1bkIzODh1SlkreElDbEpISS9HZ2YxbGJ2YlVs?=
 =?utf-8?B?MlhhS0JyNjFZeHJGdjNSR21vakVaZThob1pvdXpOT1VmTktlMDRlSnBwK0Za?=
 =?utf-8?B?RjgrQXI5WTZzaXhCVE52aTRMWHJ2L1VPVyt3RVMvRi9kVlU3NUdXYVh1c1hv?=
 =?utf-8?Q?NqLhoRpeZ+l8Fvq0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38ba403-1af7-45aa-efd5-08da2ce56d28
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:15:11.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJJ9wfdmo4tzwnBmrSBRHhkeCCjxGhYUvxWpA0Rhhe/1oI/fiXbNEx/S8A6Jq5U8rWAcI3qwthA6F7RjRoxBQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2408

On Tue, May 03, 2022 at 10:17:44AM +0200, Jan Beulich wrote:
> On 02.05.2022 17:20, Roger Pau Monne wrote:
> > The symbol map generation (and thus the debug info attached to Xen) is
> > partially broken when using LLVM LD.  That's due to LLD converting
> > almost all symbols from global to local in the last linking step, and
> 
> I'm puzzled by "almost" - is there a pattern of which ones aren't
> converted?

This is the list of the ones that aren't converted:

__x86_indirect_thunk_r11
s3_resume
start
__image_base__
__high_start
wakeup_stack
wakeup_stack_start
handle_exception
dom_crash_sync_extable
common_interrupt
__x86_indirect_thunk_rbx
__x86_indirect_thunk_rcx
__x86_indirect_thunk_rax
__x86_indirect_thunk_rdx
__x86_indirect_thunk_rbp
__x86_indirect_thunk_rsi
__x86_indirect_thunk_rdi
__x86_indirect_thunk_r8
__x86_indirect_thunk_r9
__x86_indirect_thunk_r10
__x86_indirect_thunk_r12
__x86_indirect_thunk_r13
__x86_indirect_thunk_r14
__x86_indirect_thunk_r15

I assume there's some kind of pattern, but I haven't yet been able to
spot where triggers the conversion from global to local in lld.

> Also "last linking step" is ambiguous, as we link three binaries and
> aiui the issue is present on every of these passes. May I suggest
> "... when linking actual executables" or (still somewhat ambiguous)
> "... when linking final binaries"?
> 
> > thus confusing tools/symbols into adding a file prefix to all text
> > symbols, the results looks like:
> > 
> > Xen call trace:
> >    [<ffff82d040449fe8>] R xxhash64.c#__start_xen+0x3938/0x39c0
> >    [<ffff82d040203734>] F __high_start+0x94/0xa0
> > 
> > In order to workaround this create a list of global symbols prior to
> > the linking step, and use objcopy to convert the symbols in the final
> > binary back to global before processing with tools/symbols.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I haven't found a way to prevent LLD from converting the symbols, so
> > I've come up with this rather crappy workaround.
> 
> Perhaps a map file (like we use for shared libraries in tools/) would
> allow doing so? But of course this would want to be machine-generated,
> not manually maintained.
> 
> Have you gained any insight into _why_ they are doing what they do?

I've informally asked on IRC but got no reply.  I've now created this:

https://discourse.llvm.org/t/conversion-of-text-symbols-from-global-to-local

> > Not applied to EFI, partially because I don't have an environment with
> > LLD capable of generating the EFI binary.
> > 
> > Obtaining the global symbol list could likely be a target on itself,
> > if it is to be shared between the ELF and the EFI binary generation.
> 
> If, as the last paragraph of the description is worded, you did this
> just once (as a prereq), I could see this working.

Yes, my comment was about splitting the:

$(NM) -pa --format=bsd $< | awk '{ if($$2 == "T") print $$3}' \
      > $(@D)/.$(@F).global-syms

rune into a separate $(TARGET)-syms.global-syms target or some such.
Not sure it's really worth it.

> Otherwise (as you
> have it now, with it done 3 times) it would first require splitting
> the linking rules into many separate ones (which has been the plan
> anyway, but so far I didn't get to it).
> 
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -134,24 +134,34 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
> >  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> >  
> >  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> > +	# Dump global text symbols before the linking step
> > +	$(NM) -pa --format=bsd $< | awk '{ if($$2 == "T") print $$3}' \
> > +	    > $(@D)/.$(@F).global-syms
> >  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> > -	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
> > +	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0.tmp
> > +	# LLVM LD has converted global symbols into local ones as part of the
> > +	# linking step, convert those back to global before using tools/symbols.
> > +	$(OBJCOPY) --globalize-symbols=$(@D)/.$(@F).global-syms \
> > +	    $(@D)/.$(@F).0.tmp $(@D)/.$(@F).0
> >  	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
> >  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> >  		>$(@D)/.$(@F).0.S
> >  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
> >  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> > -	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> > +	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1.tmp
> > +	$(OBJCOPY) --globalize-symbols=$(@D)/.$(@F).global-syms \
> > +	    $(@D)/.$(@F).1.tmp $(@D)/.$(@F).1
> >  	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
> >  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
> >  		>$(@D)/.$(@F).1.S
> >  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
> >  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> > -	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
> > +	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@.tmp
> > +	$(OBJCOPY) --globalize-symbols=$(@D)/.$(@F).global-syms $@.tmp $@
> 
> Is this very useful? It only affects ...
> 
> >  	$(NM) -pa --format=sysv $(@D)/$(@F) \
> >  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> >  		>$(@D)/$(@F).map
> 
> ... the actual map file; what's in the binary and in this map file doesn't
> depend on local vs global anymore (and you limit this to text symbols
> anyway; I wonder in how far livepatching might also be affected by the
> same issue with data symbols).

If I don't add this step then the map file will also end up with lines
like:

0xffff82d0405b6968 b lib/xxhash64.c#iommuv2_enabled
0xffff82d0405b6970 b lib/xxhash64.c#nr_ioapic_sbdf
0xffff82d0405b6980 b lib/xxhash64.c#ioapic_sbdf

I see the same happen with other non-text symbols, so I would likely
need to extend the fixing to preserve all global symbols from the
input file, not just text ones.

> In any event I would like to ask that the objcopy invocations be tied to
> lld being in use. No matter that it shouldn't, objcopy can alter binaries
> even if no actual change is being made (I've just recently observed this
> with xen.efi, see the thread rooted at "EFI: strip xen.efi when putting it
> on the EFI partition", and recall that at least for GNU binutils objcopy
> and strip are effectively [almost] the same binary).

Right, that's fine.  I would still hope to find a better solution,
this is quite crappy IMO.

Thanks, Roger.

