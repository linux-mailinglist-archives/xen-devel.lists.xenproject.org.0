Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1422F8CC7
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 11:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68955.123576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0id4-0003nb-EI; Sat, 16 Jan 2021 10:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68955.123576; Sat, 16 Jan 2021 10:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0id4-0003nC-AX; Sat, 16 Jan 2021 10:16:22 +0000
Received: by outflank-mailman (input) for mailman id 68955;
 Sat, 16 Jan 2021 10:16:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZev=GT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0id3-0003n7-0D
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 10:16:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eaabaf0-b538-440f-9229-fb0648a2658e;
 Sat, 16 Jan 2021 10:16:19 +0000 (UTC)
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
X-Inumbo-ID: 9eaabaf0-b538-440f-9229-fb0648a2658e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610792178;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8QbbHal6ZAcqOT9d8vMpkWJKy2ifg03ulRnqDhJqTRU=;
  b=SbfyFYd9qsWVehJd3+v7l8H2ku5Ql84m3JdAc8psJLmHOMD7Ypdt0yB2
   Smi1jstORC4ca9J4Rg3/43wqCt0mjeI/PqIA9aSJDUGdscmiuEUSR9qg2
   u/JpBvqe6ZP2qHu1z1tuGM1kIZGKZwnl+O0SPoN6xhfqlx47sGzgXWZCD
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XaThkaRLLh5SrRFXB7EI1t1KQn5YgPvIZKOjfnHSzHBunVsS5b/ksPLzkgUaMLlt9Ge3QXrXg5
 7Hz+MONYi24ny3epgT1QZcwiM1/5rfkQ2L9nbMvQbWU9Ye+BcM5LY6edRJ8htakX3NzLrVBK21
 FbErWSmX+3hIERZdfgoJEeos2xfkYS89RvAJh/GGWoJGLv6TPpvhtJpAe8vMXaQ4tH1cMwSCjz
 u9IWHVBFGSuqurzyQECPWuhqgi48s0v9QnFV9yjxsfIkrmTWWmZDZdMMitP8m3xKzPetU4i+xw
 98Q=
X-SBRS: 5.2
X-MesageID: 35232249
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,352,1602561600"; 
   d="scan'208";a="35232249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOsNtuZ62UMY3sMKqESSCk38khFcYzu3ztguwIu96Kx2/au8hkOU9389p2MV8Kev4/yzQLwL3kQh3A10kIXa9bMBhARplSjI9DokkyVzHQKAjy52l//S+sZtzkdjOo4jab63JJFQB6PEEB920AO+xkevbqkDZJXZXaKkzRF2WHTBcZt1nR9KosI0zSgSKNVZ9MQbgb/mtrNILiFKy4UmB10UOb1fHIZz3Gv7VxnN2wvPyX+TL+1qmRoszcnWRstVO6NPWHiednuMEpjKN4fAHRwS0JccymDFsJwIFuWxI+tzQ4ykXETxpsQxaBA9rcEOWmWtT50FR1AclWLrqrJzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkH+fz4wAXkfkCO0Gm99rjkQOYsskXH34hpW77iZDWc=;
 b=AqugJm1rgm89akMGwUCFeYw4vp5dPQ6Tg1AGaWhslZgmB9Jr8TE748zQNe+0Iwnk216TUJfF6I3NGMlnOkrgQYRuVam6cU3jdzi+it5XkwxmaJR1nwzwJ9QPvky+n0hI79v9UVVsoRJON6gnp9NYPdjbl9Tf9Wrs6DGFs4B5faZtoa39vaDKah8VN7xqWmQux47F4ookLhLiGPdeNt/dtAr5seusggl9lA6Xdpa8PNCJqtA+bCiKmIRkgfHHy17Ticy9TIgRlytSt8UEO+DQLLrA5k6NBsejds5yY9Gv5FuHdcogVi459DzLis6ti2us9hoq6yFbfD/daHBcjgvMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkH+fz4wAXkfkCO0Gm99rjkQOYsskXH34hpW77iZDWc=;
 b=wRt6uG4bzOsHZKR//ygbjDzJZHU9mgspWViC4rt1pHhSHpkenBfetxcTIAiBfYtCRKQz/vCRl9ADLItTlYSLFfho86ZIOuX2b91TKvKbY8iPOTkNtCfP/bOeDbR5ZoWBLpkhtq8J8ISBea6ikyumD4PgpMZFS2Qm31Tj9sXw2S0=
Date: Sat, 16 Jan 2021 11:16:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112181242.1570-17-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99af3780-2a61-4077-ed10-08d8ba07c092
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB508410C8E54904D7383B9CE68FA60@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnE/xALRmxTca3wePmSwK9DjQjzatmkD23I8+NcQryiYWq3RQ2gIY8trC5UjAhRzeaYB0TAmQ1CX9samb+aGevzb/XJhnoLLlR7puUtlFxrGW4mfjUfyT3xv+JICyC4QcLUgvG9muK1o8kv6r+H7mRAoNYAPweMPuh7pnhFL6nRiaL8x6XWht1/ljgMRQ6KVXco//XSE8w1epXr/u4Q+NC3/zQ7ja84kKY/WIOmrELKcXeRdfAufhSJDrx2WrbpM4CHClv1SMq38+Lq9ONSeE7nscMbMFM5cz6agI2DTpMkbt+plLbRsJOPi4t0RpHffwe664tTTD/BJxeCZ++oysNoaizPCnKBNmVahrJetsxgwcsJDe47HGJAw3ZLl9jGIAZV6EqXDhz8tzSGlEeg6iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(39860400002)(136003)(346002)(376002)(26005)(16526019)(186003)(6486002)(83380400001)(54906003)(316002)(5660300002)(478600001)(956004)(1076003)(8936002)(66556008)(66946007)(6666004)(33716001)(66476007)(6916009)(107886003)(8676002)(9686003)(85182001)(6496006)(86362001)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkdUVUJvUEQwOEtVM0lVRDczY2o5azFEd1kxU3pBL1RvS2ZJVGlRTzZWUk1Z?=
 =?utf-8?B?UlZNdHIvS2w0T1J6NkY3RkhMMi9JTHVYMjhJQ2hDaFZGTFlmcGE3cDVuaklW?=
 =?utf-8?B?MXpXNFJmeTRTM1BITEQvUmpIek4rdHJZUWhKeTc3TW5mNnhCN29ZSk8vNXRN?=
 =?utf-8?B?dnZhWTZwZnh4V2REQTlFVldUakhzWGxoYURqRzk0ZG1SNmdnbk04andWTVJT?=
 =?utf-8?B?Q3EvdGxGS2FHTGE3a09zRUJnWlhnbEZiSThEMDdSWGdKUDJLN1JQMGJjbnV2?=
 =?utf-8?B?UE5KRDZ0dk9TTjcyaXEwcS9lSWM4TTRwM1NXQzNVYUJCc0x4S3NmTmlIVjc0?=
 =?utf-8?B?UFZwY2Z2dU1acGc2enNnVkxneFFCckJEZmU5YTRuNXFEQk40SUFRck1kSm9s?=
 =?utf-8?B?bVZtVHI4dVNjWGUvTjFSQVV2NGR2OHRGTkNpSHdqQ05DNXgybFhKbTE0dEFo?=
 =?utf-8?B?bVBDeEZWdUx0Mmw0VjZqOWRtVGdlRmxxQnJ4WlRydGtWZ0tQRW5QKzJmMi9L?=
 =?utf-8?B?NDQxUm1FSVQyU2E1c0NkMmVmSTRYVHJWMEhaUEpIVFNucTJ3dStUZWhjNzFT?=
 =?utf-8?B?Rm45dUpsajkwQmhlWmVoK2NrV2l5NlM0SEh0c1ZUSjVtSWpJUldLeHYxRmdY?=
 =?utf-8?B?VE9ITVI4YmRpQmU0eVpnK0xJUTFhOUhkYVJnMEZ4OS93QlZ6eVE3R3RSVlNm?=
 =?utf-8?B?NGlqemxMc0hFdlRnUzNVajZqT1FNWlE3YkF4ZTlyWnV6L3pPQzVXaER2QVZ6?=
 =?utf-8?B?YWhOSkJhV01zWDl3L1NCSHQvdGpIWXF6RUloODN1VTlSQkpPVWxrZ0phY2dw?=
 =?utf-8?B?ZlBFdG43MVkzTHhPazErQzBqWVkyblA3V1VBSyttRjUvcXpmWWZ2dEc2clYv?=
 =?utf-8?B?aWdPWlNqTkxJTXJPWjYxMFEvTlpJbTVvRnhTZlBwZmJOVE5UdVU1RDNtUzdV?=
 =?utf-8?B?bGlwS29DWDJnNFpSc1dHR1lGczRvRitqZmpWcGhERVJKeXBiS3FpQ3l1Vm9K?=
 =?utf-8?B?MW9zM1B5OHBkUStUVkhIZnpWanJYRUVEdEhWUFdPNlhLVFhyazlFbTgrU2Fj?=
 =?utf-8?B?dXp6d1V5OVE2SEN2S21ZWFRWV2dTdkZscmRrODNiODZkSWpLVU1wR2tMUWEx?=
 =?utf-8?B?TVU4MGlXN2dVMTVQZm5ud3lORHQrRndhYkl0QzgreVNFeTRzVVh4L3k3aHFt?=
 =?utf-8?B?TTlrQXZ3RTczUFNNcnFIeDdqQndCK2Yxa0tzSnRhRWNQQVIzeEdlN3VoOWdt?=
 =?utf-8?B?dzZYUms5TVRIMmdFRmhIS2l4VkFKQm5oTThVc1BCRVNqd2NtazhsT1pZWDV1?=
 =?utf-8?Q?k5QH3jJAJvNMf3KJNL3zHRP4St2GFSo8jK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99af3780-2a61-4077-ed10-08d8ba07c092
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 10:16:13.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9XVavYJL09hGWSbCwy4tvWhGEETVUKuI4CzNGUwyHrgd5vPRFBk3uK9S+tnyL1yrKhUZ1wifyaRvkOYjEfStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:37PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Pass bridge name to qemu as command line option
> When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> to be used by qemu helper scripts
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> ---
>  tools/libs/light/libxl_dm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 3da83259c0..8866c3f5ad 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -761,6 +761,8 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
>          int nr_set_cpus = 0;
>          char *s;
>  
> +        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", domid));
> +
>          if (b_info->kernel) {
>              LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
>                   "qemu-xen-traditional");
> @@ -1547,8 +1549,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
>                  flexarray_append(dm_args, "-netdev");
>                  flexarray_append(dm_args,
>                                   GCSPRINTF("type=tap,id=net%d,ifname=%s,"
> +					   "br=%s,"
>                                             "script=%s,downscript=%s",
>                                             nics[i].devid, ifname,
> +					   nics[i].bridge,

You have some hard tabs in there.

Also looking at the manual the br= option seems to only be available
for the bridge networking mode, while here Xen is using tap instead?

Thanks, Roger.

