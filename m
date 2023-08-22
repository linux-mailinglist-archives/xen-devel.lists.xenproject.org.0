Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61A783A21
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 08:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588155.919630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYL9K-0005xo-25; Tue, 22 Aug 2023 06:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588155.919630; Tue, 22 Aug 2023 06:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYL9J-0005w2-Ud; Tue, 22 Aug 2023 06:45:57 +0000
Received: by outflank-mailman (input) for mailman id 588155;
 Tue, 22 Aug 2023 06:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYL9I-0005vu-AI
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 06:45:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a7550c0-40b7-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 08:45:54 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB8015.eurprd04.prod.outlook.com (2603:10a6:102:c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 06:45:52 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 06:45:52 +0000
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
X-Inumbo-ID: 8a7550c0-40b7-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRuglntHcpsw3k6sEuEJPGlWb2NebDrh4NUgXhfofGu84y9wnrCb8wZt67V/0olp9rg9+2VoBOtko8bJ9H5mSe6WvqALpn3IZynrrg5ezvirawOIDJGAzQwr5XpO8CShBElZp+Oqu9duCNixfoGRWI/7NqKb9umqiIPwS09znEsHYOKjp7CkR3HKj3UtyG/pL7qqJ48GrQn/2XZVTheTFUY6xa6YoELVueJnrjUUS7ha/k6CSbNsEXHYgrOCzCANERSSB5U2q7/kspj6OYUt5XLTPADDnoa7CnL/uDOJzK67VG8PSehRySArJOPwZdLvh2Vj6dmuX0J/vApQho/u5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN4afLUHwdu/SbqTyT1sDAKRUKs8AVVdi8jlPxvSCHQ=;
 b=asaDQ2NzBsT1+X1pHN+socHHLy8VPiXalPqdGr3ubvSmqCFqz4TKtaUZwCdDbLVN7wed//F9XvcA+xm6T1154J+SmmFQMcEukvbDh/xqQE8t0AmlBtkRywH1Y0OQm/89igeLMsNt47wp/hQLwlENFMiKSUEj0+GT/SCcMXzzp0zFEBDx3akY0uDm9+Z2c860//+jofyHwn2uFj1cn32MgOo+mpAVQRlo6zZ73jyWgKXC4lWaq5fM3B5WpQ5dChfDs23+IpUOS/O7sXUCFFGGB3F+JYitg0O5BG3FqbUtq5rCqwaiJc49HsnWb2Jm/LBnS9Nk0vhoxtswftCBxmtuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN4afLUHwdu/SbqTyT1sDAKRUKs8AVVdi8jlPxvSCHQ=;
 b=ve/t3CYuWNqNyNbr4H5epLooJmzVIcD6G4eFshg013JR3XknjbZ1/gI5qMjh83ruI02wGWfNIEOFf+uQFtCKlSdtfGZu7TYqgipyEiTvtfhNPaGrt4LIfJGzfi/luoLsKc2rF6zsEAV4KAi92XdVgXH/3+Jyb+4bTRFCCGd3/IzfcdMak9sZXDyFkMn1k2rkdqM5NgQAk7jf66K6gBLBrVZfIdQo/FTwoweit4tVtGOSu9dKTRSUYjPYXubr3EWvKJLQHA5pi+e5Q8Zk0M/XADdLyu3b9WSmmIb0m57bK5cvoRPkGBnnWpb9PB9oll2g7gcD1oUnAHEFh2QGNLgE4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab73c4cc-7706-a64e-f1ca-286d2378ebc0@suse.com>
Date: Tue, 22 Aug 2023 08:45:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v3] x86/hpet: Disable legacy replacement mode after
 IRQ test
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 1191725c-3a56-4217-888e-08dba2db6dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mz2hsugRTFTKxyvnI1iEhRGB9WKHbGKxKdA/ZvkR5IXEcSCL7krs/HMZZWsLefqJ9eQlM2lWedfHN8KsvjDSJrMBbfxRaTikWa1D+mB43G/WB4dsxBQuF/JSNxMrrpKgmv2eFt7itXsY3WW4Qx3yE5kQvZjy4VgitejEHQDWKSIZgqI00DhDJN0QissMxno0lSaNIKYCwcGmViS57uPCdjQtTWn5gznXrbqLgMt0DbVI5Yjbc3RFF4wG+aOK22UsvI6KNbK2xrZVsEAGqVb9ZChs+LdSYIV4tloBmXGHkKO1+0Q+FJPa6T2fs/hkACFZA1zmcv6LjihnTAL96aclstXxK4S7OSbidvKkUzF8kDZX13w4ku1JEOMXoJs4rzq0PXlCj9m21lW+WLO+hFWezk+pJpAR8cH8eL2MlFilpnpMLvlZ1KMqOYkJg7PX6N1vdOSBWNfjG3vAdUQ00Z0bIEhxR1c9uT9r5j+irsRe+GJZzzKA62uyH8/tJs0TbciveMLsKl0IOAWh5DLFzziNEdBFblEU5mlSw8MvpHp+pb4qUWz7au6jJSjSzb1G1tqfzN0pSbqi2Nzl0H1zo4jtDeBHIq5/CfArzP8GIsRd+CMZL9x0h5gjB3N2uIiQJJXhOTUe1xOyUEp0ANrR+Xwe1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(1800799009)(186009)(451199024)(6486002)(53546011)(6506007)(38100700002)(6512007)(31696002)(36756003)(26005)(41300700001)(2616005)(66556008)(2906002)(6916009)(316002)(66946007)(54906003)(4744005)(66476007)(86362001)(5660300002)(478600001)(8676002)(8936002)(4326008)(31686004)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0hVc3krSVp5ZDJtSDI2TkREenBvM1pZVzZZQXVNQWxFV0J5U2lXQyszeU9q?=
 =?utf-8?B?d0p3dEkyS1dqNHF2Qk5zVTJIVjR0THZiOHA5Z2NBU1l5RmkxZWpMWk9za0xK?=
 =?utf-8?B?YTd3di9CVHZzSWVyZVRMMFJwOEdKZUg2aEJ1STRVdnEyYmo2dlp6QjNLdSs4?=
 =?utf-8?B?SkZuZnFvOStJVlo4eURuMFlGUFJuNm9tN0pkNVR1V0VOMHZnQ25OUUV2dzBM?=
 =?utf-8?B?ZVhsOTB2bXdYek5mdlBDcjMrT3dyN0FEeUNJZ0VJaFU4d2RSNDBWellqbUpV?=
 =?utf-8?B?d1dtRlZoclAyVW1CSlF5bExiVkRmMThremhMV0dFcWJSdmFNczdaMGU5R3Ir?=
 =?utf-8?B?blovdHJGRWlWUDRNTWx4b2FTQVorMmc4NWNoSlpzWWJzdHZyRU93MDU0UTlF?=
 =?utf-8?B?ZFduR1FmbTFEckNCdHBBRzVRVFhVaFl1UXdRTVV5Lzg5SG1rd3htcnFaLzZu?=
 =?utf-8?B?amV3ekJsSStRUFBXeVdUVFZxUmpqUGl2NFJiV3NJQ21qUm14amVSc2FCd09a?=
 =?utf-8?B?blRNdnlzdVJRbTZwaVB3VkhNUFdmenZKYW5KMTcwellHaDA2bEZEWXhIRGk2?=
 =?utf-8?B?emNxS0NsTjJ0RFV1VzlqaTFyWTVNR1E1ekJqa0pTRldRRjFuNmVqRVZwaWhk?=
 =?utf-8?B?R3JuenBaNktkRkVzMmFHRlpvbGo1NEZlUzZqK08ydTF4NDIwanZPTmlCanVY?=
 =?utf-8?B?enJuQ0hMUTNXN3h4cGVSa1pBVHVXSDUzY0I0aDNHZ1V5dUtQMzc4SkNDWHZI?=
 =?utf-8?B?YzJpODlvdENOR1cvdlpqQlQySGNXQi85ZVVNSXBRZUs2a0NiNldVTG9aU2RV?=
 =?utf-8?B?YURqUVQ0Zm42RytwRmlLbWI2NU56SVl5VE9FMEVrWjd2bWRXRWJhRGlLejhl?=
 =?utf-8?B?ZXB1SVV0UGhMUVhWQmhsMVFKdlFOeXJvU1JKUDNYdEIxNjhkKzF0S3Z3bVNy?=
 =?utf-8?B?Q1Y0UURmUDk3eHdGYXFJWHhTcjVPVDVzMGFsTlhQQTJINXFHVGJ6aG1JamhM?=
 =?utf-8?B?UU5rZHlQMFRST1kxcWMzMTR2QnNhRDYrSFU5anBGRGZmaVpuQXNBVzVCbUZU?=
 =?utf-8?B?cEk4Vm5HM1R3djMvVGdodjFSSGdTL1FydjNrYVlmTGFFcWVkVStNeTlBWTBS?=
 =?utf-8?B?OGp2TjdJQTFRMm44TWlLTFZMeWZkQ0hLdmtvQmpZMkR5MGhLVkc1NWFxT1ZU?=
 =?utf-8?B?OXRMTWx2VXFZZ3JUc1YvM2xxQU9VL0Z6T21LTkhaZXg4YjFYOTZRSnpuR2VR?=
 =?utf-8?B?TnFlQ2NiNHdLKzF0S3dsWXVmaFZXbS9lQmZZUjIraHRUUk9lbldCNEpPK1VU?=
 =?utf-8?B?Q3JLVkpZb0NheU1zenVrV3NsUUxQazd3K25tai9pL1ZzSVhUeUlPTnRnMlBa?=
 =?utf-8?B?WnIzd2ZMSlNTeENsYWQzUUZ4dUJsRFUySGN1VTNPZ3dTUXhSRElrZDVxeENh?=
 =?utf-8?B?OTFpcUs2ckwxSGZOUTVYT3ZlWWxYZ0dKWmJmSWhoeFRGTDVrMEhCUkhFcGZM?=
 =?utf-8?B?WjZYeHFKLzhxNHNjQS9naVd2N0JuU28wTk5wbW1tb2NCOC92Rzg2cFZ2SXNk?=
 =?utf-8?B?YlhrczJ2ZTNXZk11VzVrWDBOb0c1UjZ0Mm94Qk1FS0dHTWpDc0hMSDJnTTE3?=
 =?utf-8?B?Wk5tdjk0MU8rcmJSL2daMVc1S2VuVjVRTEhIL28vNE01NnZPSlVtTjJTY0Zm?=
 =?utf-8?B?RlVmWklOUHRJYVpwYVM5V0NoWEdOTDRtN0E2ZmVQZWRMSUF1UjBIMWJPQkp2?=
 =?utf-8?B?M0JseUVPVWJuMngxYXV1WmJHWVpzWmRvTHI5U3lFNVpPbThRSEx1UGo0Wm9t?=
 =?utf-8?B?UlBnZkJDSDJIU3ZlazJvaVpFN25BTDFrQ1J5RG0vR2NVOFk2UGFvN2hxSy9a?=
 =?utf-8?B?M1B0Z3ZheVRWaEpYajhndTQyck5tSC9nWDVwYThNUlNRellKKzFKdkFDM2k0?=
 =?utf-8?B?RmpuTTdqbDFmL3NqdFpvRlg1RnFPTWx1RGh1S0tyMDRkY1BmSlBIK3ljYzBD?=
 =?utf-8?B?NklYcU81dGQ3TzRKaGdUSkx6Z3lHbDFPRXNyTzkvWFF3bFU1VjZsaTJ3L09p?=
 =?utf-8?B?eGZiVGFVRFozZW04Y1g2N2hROXIyeS9OclBGWExpWHFrc25XZEtQQXIzYU1J?=
 =?utf-8?Q?T4Js8406uLQdEHYipKHEGLa0d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1191725c-3a56-4217-888e-08dba2db6dce
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:45:52.7807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DIcRaekfo3G1YlEeVZmeGJ5Ertqu+i8QAF1I9glv3tbCX00Sj+0mliw/ICp2oBxFs046Y37Cf5CyEGmLuGU3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8015

On 07.08.2023 13:28, Simon Gaiser wrote:
> As far as I understand the HPET legacy mode is not required after the
> timer IRQ test. For previous discussion see [1] and [2]. Keeping it
> enabled prevents reaching deeper C-states on some systems and thereby
> also S0ix residency. So disable it after the timer IRQ test worked. Note
> that this code path is only reached when opt_hpet_legacy_replacement < 0,
> so explicit user choice is still honored.
> 
> Link: https://lore.kernel.org/xen-devel/cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com/ # [1]
> Link: https://lore.kernel.org/xen-devel/20230718122603.2002-1-simon@invisiblethingslab.com/ # [2]
> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit I'll likely wrap the printk() slightly while committing.

Jan

