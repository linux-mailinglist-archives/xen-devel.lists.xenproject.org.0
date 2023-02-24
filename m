Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE466A225B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 20:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501514.773293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdl6-0006ac-OT; Fri, 24 Feb 2023 19:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501514.773293; Fri, 24 Feb 2023 19:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdl6-0006Y1-KU; Fri, 24 Feb 2023 19:29:32 +0000
Received: by outflank-mailman (input) for mailman id 501514;
 Fri, 24 Feb 2023 19:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVdl4-0006Xt-Du
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 19:29:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c7a71be-b479-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 20:29:28 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 14:29:24 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5907.namprd03.prod.outlook.com (2603:10b6:303:6e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 19:29:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 19:29:21 +0000
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
X-Inumbo-ID: 8c7a71be-b479-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677266968;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OFro7h0AJZcfednimzLgri+QYxEpuz4UHy0T/n6gh5E=;
  b=bWEbXWXqbdwUMz0QqYYEanI/vt011p/o8K1TpZafnBSBgfq6WGvitK8W
   BKyWJmlZ3ZXuutJI04qw6HT2OG2XQO15ex1A53ZELwBxWHtf7GXhxgSZt
   U4wCuwpESY16eqoE/C6kFv7kxu5/SWOLXalH/NC7uU5KPmvDKmQtMGxFV
   I=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 98460822
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:p+IeM63Y3Wli8gb04fbD5Tpwkn2cJEfYwER7XKvMYLTBsI5bpzEEy
 GQZUGnUafjfYjChed8gOY23oU1VusXTnd9rTQZkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBDxt3
 9AReQoxUAGCltPt7J2DFu9ImZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFQZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKrBNxKROfinhJsqAKr3HxKLQA5bFimoNCXg3KVYsh8N
 mVBr0LCqoB3riRHVOLVVQCisneAuRIbRNN4HOgz6QXLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseIa3k9uzHzjzy
 jKLqSEWhrMPgMpN3KK+lXjEjiytoN7VTwczzgTRQm+hqAh+YeaYi5eA7FHa6bNKKtmfR1zY5
 HwcwZHGtKYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX742u9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:ObH81qreejEeJ5WjsGUIpmcaV5rreYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafNJGk/t+nWyk2TKfFI+qjizEir792uskuEm2tRGt1dBwQSMHflLqVvLjM2YqbQjP
 Cnl7F6TzzLQwVwUizqbkN1JtQqvrfw5erbXSI=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98460822"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFHEARyaLXPh8RuJgp7Rh5zkejSTa8kL13S2M/bECMcloO5Zgph8mi4TeKWZlwyXoGSTUEt7EQKpRp27iPkRoWfoTdtyOPjbjT2BeigbbB84Q4PbZVMOaJzOhw1bpIAnU8/hq6HEJmlcuAQ6rdt0HHNB/a33DWklSKRSseyzbIr/zfO3AS0Xu9ea+H+xeyCue3TC1/s+sxs5gaqF/IrZl2TUXt2cfVmOcMGPr/UadPgw5a7PvaHjMfMGzQwrihwB2NrSef12wukhI135gefIuVGDyyo5Fg6fqZ7CgTfvdAI0V+3w7/Bfu9HhG4fy7/T0Ckp3nAbFB6ISC2tu6Xgxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF72UqMKYtYo7gCbrTF6rw0GunHgKCYG55j2RyMonFc=;
 b=S2tq12jnyqV7Z/c0+0s44g4cxjEJUme7yHmkckjj9qNzUbmly9DbrjN3EXVjZk7j9voj7JL1E3mv5jubkw6JbcDu8rOIdi5LdtIQ9GvDz35UvRTzJWd/rOlithBnwDLwIgVCVpA4vANeCy/OjZ7P/VA/YnmQmrfxFT/PvI8ep1Ik6144ggYSM1MWPqICgHlypnKICr7X4fu4F1CikEoZL4PciaHtIuvFz3CkrKFkVC6jfHXDA9O7qcQIvwTLq1gkA4UZejYZO7pn2GHSP2D2SzBbcNxvvNSR7yi9H7WZRhhEDmv66YGAC6oVu5DvNw+JwMeW/xfbFkIUl9LT8N+iAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF72UqMKYtYo7gCbrTF6rw0GunHgKCYG55j2RyMonFc=;
 b=MtKSjQyNkVYzCcogLitVGW/A1d+Jvnr/EnI0tWzcFJMdWPZWMfnNEnhHwXH/+K4UWV/QE9U57NIHc7HRKOSIFdyLjZ5Dc/BTpETEz3fmyFLJOYsr2Tl+oULvo6IQ2ZBxnWdnAZ0/C1y4NY51eo+aY2qiIf3QMfv8R8dUo/9y32o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
Date: Fri, 24 Feb 2023 19:29:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 896d71d6-f5d2-46f1-1c6b-08db169d6de0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RJOE6Nhni7/rfVGfJktkzdqQJrxE38y/W4kmsNV445TaeJaa7conLM26HscsOmlI8Syjxbk/CcxdP46e4Wdzw0j0DJrdADuRbAhkAbtV9YLOFYzR8v72Rk8p7j3w4ac5qfv58bynfTv4ulLVCQFt29C9Ux6CE8b9TQexL6Wj1hRDXx63Qr0IJkg3sakNn3lNnkdL9+N0r+6r/r9YPxZ3DfPy/iTairDMAEb5bWYOK0HfZHwTCB83QEj6fJ/1MNcVzxqhKW3aL6XRDBmHZACS3uNzqu8L5klCwUx+Xljj1+3BhTsW+AW5MlTS6LURfL23VLH2W+ZYqsGG6RCrAUydh7L2XioZIK+30H9xOGhKszri6L7edbO7kk1SouR+vsStIxklzpo6exg2eEmupuZMgGhrkBpGiIixMSxUe2x7dZjdqSpytaBfkoZQ7UvYB/5/Sjv6D72iiTWPiQ7C2d20/pShpJwZycchbX4KkVdnlmeLZRLtdWU1CHlwZpwgxDIF7CNi8QDcbaYMF9Om+q1pRyQWzgn/+ZsUbXXrzutGIK8yBHEKFAP1dJM8cQF76iVON22eyG8fzySBopurl8YfSZYtvXOybQLzx2UG3QHmDtcPag8nvua7kce8SxLg69HyutB6ZgnfTwxnngFVBXYFrByn/tBbXj3BtbbfS6EYjfsZYerW/dimkxpW8WKq/uae5/bfHQvtLQ6h4afE2t/XiM8jCSGkzjNjZLqyBFGHjXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(2616005)(316002)(6486002)(31696002)(36756003)(86362001)(54906003)(31686004)(26005)(186003)(2906002)(66476007)(4744005)(66556008)(6512007)(66946007)(8676002)(41300700001)(53546011)(6666004)(6506007)(478600001)(4326008)(5660300002)(82960400001)(8936002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0xUVlJ4emQwWE5IcjFEQUM0MzdlOXJ6WHRsVitDUmRTeWVZR3ZIY2xyYlVN?=
 =?utf-8?B?akQ3dzc4NWFHa2RvZ3N4amlJY2NQaHIzYUlkVFp2Mml0cGtBTDVlZXBrMkhW?=
 =?utf-8?B?RVl6U2hIaFdLOFY0SlRRNENzdjBqM0pJaFRmV3NOT2MwK1R6b3A0RkVsV2cy?=
 =?utf-8?B?Wkx2TE1Rd0d6dHlJSVJXaURVRFMxRkV4TWJkaGFqYnJ5bmVkV1NZalJiUjdM?=
 =?utf-8?B?N3ZIVks4OE9yR05ITHMwamNxSGljOGljdm9haGlXWTlDUkN5Sm1lV1VrTEkz?=
 =?utf-8?B?VmdCTXRpUkpQb1hNcW12VTJMTlhicHdCZktKS1FaeU1BbkFNZjlKUEhzWnN5?=
 =?utf-8?B?blpIY2lmN0s0VVZVU1l2Q3FMMG5CU0grTEVKSVA3OSswSFVlMWRlUWNMYWZk?=
 =?utf-8?B?Zll1Nk9kN29jeG1Mck9PcUM1T3doSDhvK1djNXZiTEFLWUtpN2JzbzBjaVNW?=
 =?utf-8?B?Tmdmb3h3dXBVRzlCVEtjQXlWWkVUNEdOK1QwMEg2bytrQURoVzc4ZVlnTHhU?=
 =?utf-8?B?ek1OcFNNWUk5aEZHNWVDMG1hY3JIQlc1ZFR3cWkvTkQ3WHJYVkU5dm8vNGNl?=
 =?utf-8?B?WmZhWmEyL0RkbFdtUXZ6a1hBUzJuYnNiSVVIMklIQWhYaGpHU3lDczNOMHBo?=
 =?utf-8?B?SVlYRklORGNPMzJJZGczUll4WmlTdlVYOTB3S3dpRW9Pc0JkT0ZuNXFrQjZK?=
 =?utf-8?B?aW5kbFNZdTJDREJ0clE2U2M3T3N5bmFGdDlEZ0RNbFdDak9RUkNzM1hiRENS?=
 =?utf-8?B?ZTdNbm05RVl5TDRBOStsa1htOHhYT213S1BIWThHRUMwTXZxN211R2RBNkNt?=
 =?utf-8?B?RHo5Z2tjVGk1Y2JRVkwyN29XaHQrSWxHUzNMdHp6cGdob1ZNakxhOFhiRGph?=
 =?utf-8?B?OWQzS1dBT2V1MEhkTE83MlhtWk5UcEdRSjFhM2JNeXI3aDk1d2xzNEFCZHV3?=
 =?utf-8?B?Znh6WmdPbmh5UWNYdHpDbWJaS0pLSzVsTExBNE1jL043ZU12OFh6Snc5SFVO?=
 =?utf-8?B?SFJqdEtabHhpT1VJQkJ5QzZLVDBBcWV4eTRSbDdKSUFxcEpLMWp3RHJPcmEv?=
 =?utf-8?B?d2FtSEpPc0J1WTNYc1JLV2dMVXJTZWl3a2ppbkNFcjB4WUNCVUpBQmJyVy9n?=
 =?utf-8?B?ckZ0SEZ2eUFRMkVZZm1OWkRtOU56bU1TN2xObjdnSStYOXgvTHl5QkcwQUNH?=
 =?utf-8?B?S0I1UjhKMXZzcm1FaEY5VWs2WWZvVmM1QktMNzRGRks0TTFvQmFwT3FPNmtm?=
 =?utf-8?B?eDRncGYzaVRsZ1R2SHZXNWVkb252b1FuNVBpZnp3cFFWUE5zaFVjWU1FLzhs?=
 =?utf-8?B?ZzhGZUJMYUZZUnYraGFQSnJqMEgxK0VsYm00ZWpLQnUxU1gyZEpKZzREOElt?=
 =?utf-8?B?REhzN08wWVMwM3hRV3NPT0Z3MFlUVTk3alNZY3d6czZxOTdtU3lpSXBWam01?=
 =?utf-8?B?SWZVaW8vUEJEWmxsSmNocVVZRTJ0Mmo5eDZKV2cyTko3ZjQ3YytwZ21zN1Yw?=
 =?utf-8?B?UU1vV1VlODV3RFc2WEJqR1lWazB3OXd2ZDFsWUpkTDY3Ym5EeERTeG4vR3ZW?=
 =?utf-8?B?S2JPbGd0L3dFdzM1WE1yUkx1cHQ2ZjgzRktDclN1WHNxODVyTkpoYm1GeWlr?=
 =?utf-8?B?cVVaN2JhaE1uWkY0dmxsd2RwRWZMeGRjMTNGamFVWnlFcG01aG5VMnBISzA0?=
 =?utf-8?B?azA3ckdjc0RwSFBUYnFlZVZNRGt6THBIU24vY0J2YWFKaE5UV0JyRytzOW5Z?=
 =?utf-8?B?M3VGWTAzbEJzSWxRTzdpZ1E5ZUkwT29TWGdNdWtWcitmd24waU11ZS8wZTJR?=
 =?utf-8?B?ZHMyVUpVc1o3OUVNR0wycFdKMFZNWDZWbE82TFVwYTdaRDVUU3IzODI3a0VB?=
 =?utf-8?B?UGhDS2NUcEZFUVRTOW9hZHpoQnlQSk1qS3BaQVoxRGh1TTBhRmNIaFBVY3JE?=
 =?utf-8?B?ZE50U3NXblg4YkxZa1hhTjlkeGhpWDRWNFVNazBva3c4WkF2R0NuRlF3cjhK?=
 =?utf-8?B?YkdidTltU1NROHc1TDNRekdBS1ZScEcwanJpS0wvcjZzR2Fta2MzUnA1NE9F?=
 =?utf-8?B?a0V4cXhnUHZvNUpNNG5TOE5xMlFxSStQczhPcllWRmVFcVY4VGp1NTFVTVM5?=
 =?utf-8?B?MURCUVIyRUR0TENuWkFYRDdlcXBsRnhBanFGK1hSc3BaalBBQmNhVDdKTmlq?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e3IRNp+HFslcpuMteg/bbDGp/qJI4MsRXrPo4wiM80uFh1MrzWwh21rxHv60Vxx0H1xkDawslwqx51rgyLmgM73uCFjrl+x/S7WGOqB9LDhz/CM0W7voJeA4UmI6wk93wtbcR3hsYkT4nJ6EErxNFumcTuGH4SsQq41YkiQuxJuSuMtMh6FoQwy8d1L5Z3M+um7iIJ0b4juaKEsl3KLM6rfY9Lsts69x48bHYRVYXTQWM6i/6PCyA9y6Pnta/oMTbDZEIR4SXYMNpGBceQzPDv1viVbprEyRv+LENme/zqmy0LKR+OCmzjSKyTjJ4bNN2mQnJJRQOXCH7N8XMI/AREdkYETVOLbGf/aFDcSykLyI6xh7qtCuj5VgJcYw5aa8fTR1m5rIwVWvJR143S8gNQavCity4+A7JNIUKopn6S0b3qfAFuXYmljZeAMqaKULi5k8rKytybGe5NpP1It226/yVhbVv8RrtRDdOiBID6xGkO0g9wLFm+fiGD2jEx33fJbcJj9YUx58kcgy/5OUueadZlcwdD72V+b/PauuNUDrxbifBCMYmlQFHJ8dMLZe5C/OPkyAfqpbNTogzS8ehefJWOWqOuXsq2vcZ9r4xN+dxGvx9a6RUbAYmisjd45TAtBLC2wv0zP4x/yKyCtT1uwu88Qgmgh0bcxLsf1fKhe8y8iWqY1p+GpsGuZvbTZPCU9xpzwFPCqcn16fmqPKYZOV5cza5YarR6zn03q2kvCmLr6Np2slgaXYcko8pYD9FIr9u+QP4eGWK9iym+kDdL24JbgVYUGpEPcaDEShtsH7gKeO63z0qqkVGEZF24F2vHPcZp6qL6wD0SJRuoaZ2HkSt9jXomvgLt0qf8NZX22e1m/lqMVt5jrxgoybJLkK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896d71d6-f5d2-46f1-1c6b-08db169d6de0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 19:29:21.6043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkNP3Jp7ipalSN5cVeVnymwRHcRe3P6d5wzAQOlibcYj1UfwAEdBV0tJjnqCnRh0zAP/tSIOJB+RdEX+IHaaJrFsizghU+pRmRyZ03WknpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5907

On 24/02/2023 6:49 pm, Xenia Ragiadakou wrote:
> There are more detailed per-patch changesets.
>
> Xenia Ragiadakou (14):
>   x86/svm: move declarations used only by svm code from svm.h to private
>     header
>   x86/svm: make asid.h private
>   x86/svm: delete header asm/hvm/svm/intr.h

Thankyou for this work.  I've acked and committed patches 1 and 3.

Note that you had one hunk in patch 5 (whitespace correction in
svm_invlpga) that obviously should have been in patch 1, so I've moved it.

Looking at asid.h, I still can't bare to keep it even in that state, so
I've constructed an alternative which I'll email out in a moment.

~Andrew

