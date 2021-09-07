Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960AC40252E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180609.327347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWXz-00077l-7a; Tue, 07 Sep 2021 08:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180609.327347; Tue, 07 Sep 2021 08:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWXz-00075p-2x; Tue, 07 Sep 2021 08:33:39 +0000
Received: by outflank-mailman (input) for mailman id 180609;
 Tue, 07 Sep 2021 08:33:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNWXx-00075D-HM
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:33:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a0cac9e-0fb6-11ec-b0da-12813bfff9fa;
 Tue, 07 Sep 2021 08:33:35 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-mD_xAjpyMvmvUX887eO22A-1;
 Tue, 07 Sep 2021 10:33:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 08:33:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 08:33:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 08:33:30 +0000
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
X-Inumbo-ID: 4a0cac9e-0fb6-11ec-b0da-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631003614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xY1dQKa7ru5yIZJ5fPY1MRo8fV5l6mrUGhuHVi2kSps=;
	b=augjI1XbJAnmw05LPgJpySd5LUqiChPmO/YpM9Otk6VHFnsqydDE3b+bN2JZEB28PDxc7w
	nRoVKk7I1CJqd1ZvFSS/AdX3fBsGSV8ubffUaSyWR6ej9fZZ+AuUDDj0Bt/xJwBjbf8LCN
	EjO/7RTSiMq17kORABOTzc4WE2iYXNo=
X-MC-Unique: mD_xAjpyMvmvUX887eO22A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLYeF5LjiBVT25/PCBJSed9tqDmEokCY8QzemNAa6ddp6XL1iu27Q58zsmZBy8VU3twu30ATUzeSB1oLoJDNkv4HTDuxKVZFCesSmHAPRWU0BwswRe+eEvtKEzRX98zI+ayXjISrpXLpQzjjM8K6zZRR/szvGKi2v5v+AAzgv1v6gck7y2SLjcWV88XlIOibAeXgspJEK+DoXZUoEygTaHkeJ4z+X+/PTS9zb0Bm4PlunZz9zlfy+SpZUVggz5pSPHKhWsj/NRr6PwApEa5UIRwWXlhdK08qzlypLNT/sva5aYr7VlgABURAVQ44/KCj6dIr1v43ugFsJZwyxkx7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xY1dQKa7ru5yIZJ5fPY1MRo8fV5l6mrUGhuHVi2kSps=;
 b=KrwPTgezsbvUJ4Ehm9vrdSFKOyD9R8N/KkcIYtUsoVN5PwdwEBY1nYkqej+NON8LZPmcv2Uah7F1cbjAyD84ixI+8gkRlbqrSx0MwgsDQQT8yC2oesTlCJjZf0Koc+kFLdsfcCfDsG4KaU52jJBPVuliL6HMt2np2byKS19i93Qc9nt6FmFWLGa0nAfOkV1iC/NyiOL5yL7mq+gzsF1F/ONjKGxMqDFTS367YMLNEh2KWn56oyJl+3TpMpO1uN11AHP6HEPcQ05McKkbIiKQPvuSdAPzMdcMHuqy0F2DsgJ7sHsE/ZE50hV0uDOVAsGEg0ZxfwVZsulckCWbWbJSyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210907065228.21794-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea736db5-e3cf-7eea-cffe-98ecb0290048@suse.com>
Date: Tue, 7 Sep 2021 10:33:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210907065228.21794-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e312c61-01f0-4ad5-3803-08d971da2bf4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB434991F34E0587797C0F4A21B3D39@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kWB/Pj/5Cgl0Qc2/VcsHEfof8G7vwurxa1QGmnIgMe99GhCdoWA0xyOowLhWef3rOpeHnV3Cn5lXzqGzcVHYqw9NgoAUFu/A4s/I/XCAGPSs8+an5NJ+ykvjsl3E20zSekYCH+kjeuqK4L02pSHpi2OjnVy2MqjA5b84kF4w5VCMaZ3jp+il2WHgfPYpK6e/xSvLRs1nXhBpW0dkFluArhEBSOWKdaWOgGzIY0R8XzsuMicjg1sjxYqIEPe+NtAM2urC1eu4OeelybjzzW9mQVC7z6INHps4qR6WcF/CjnG7NHULeutRKFREVeHlFXtubXkYzWvGn1eTGR+iy0eK295Uz+xHluV/vdudwcfKuigX4TODP5/pJQ4jpy8BDt8d/XWJ1PZ3sTC5TwLlRsE33O2OQN1ywKn1KXmWZ1I/LwqmSZxV2nBkzeUrVjuGc27Tk+UbIM+9buz917BEM7CCMGqUHlYbf/e9YNbYabv1TeQha+qXgCaJRUmUXQbtM2+E7dieacNk8dTZ+tGAKlfuyry3EFt/L+A4q779gV7DD6716vty2vst7Z2h0hyOKUM8gKktvOn1XojWg9TX1l59gfx4vrscpeH5AoLkdO52L/5A1P3k3/Q9RkRATgXUFJZEc3famdXE1xwiAgRbr7ghHhM3IWC2FcpmR1o+Rp7SKH3PdlOg3excc8EzVdjBvgKdOCHLMYJOduM/2jAhSxYoSl+7kCt9dZaGaLAn9BgFvt5ExFlmubxYxxEJIpO7IcPwR9ycA4C0wpp/Ti4Luo0NfG/PfqDatN9PcQiVzA0uGhPOjImNb0tNULiNF+SlbY6b/aXSL00awXME5uylrV0kcOp30wWwn1WceB7MgVN615Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(6486002)(478600001)(2906002)(38100700002)(186003)(36756003)(6916009)(316002)(16576012)(31686004)(5660300002)(966005)(26005)(54906003)(31696002)(86362001)(53546011)(2616005)(956004)(66946007)(7416002)(8936002)(83380400001)(66556008)(66476007)(4326008)(8676002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0tsTHFUcldYV243bnhpMVl6YzY5WU9DUnFmZ1N0NG9KNzlzOVpqWEtON0VX?=
 =?utf-8?B?OEJsQjI1bGU2K2w2TVZvRytTeVNXZ0ZqRkJNVjU3NC9QNUI2NEFlNmd1NUhx?=
 =?utf-8?B?dDFLM1lKdUxrbmMyWXpwR0pjYlQxN3dZaXNrcjhiKy9sck8zZEZzN3VDdnNF?=
 =?utf-8?B?RkV6VnEyd2RyWUtvQzQvMitkN2ZiRUxIVGlRc1UxaVJ0MGdEOXVVM0F3d0Y4?=
 =?utf-8?B?WXI3MWdkQzJEa1JBelBMOGR6aFhCUkZ0R1lHcmw4enQ3aHYyNkZMQTdNbmlk?=
 =?utf-8?B?WFdFcjdQVGNWbDVYcXRreDBTajlrYUdqSTQ2WGxjSFVZMWNSWGd2QUJ0dFY1?=
 =?utf-8?B?TGkwQ055aU1vTU5sa1JCQXBrakVKaDRhK2xXWEtWM1VJZFdiNEQzNmxoQTBG?=
 =?utf-8?B?Zno0S0JCWjV5bzJVS2RZT2lySXdlNkdRWUlyY2FRWmVxNmpFY1ZXQ015bHVZ?=
 =?utf-8?B?MGpnWjIvTkFZWm5JZllNS016SWdRTlZFR29YbmthY1RVcC9TeUUwN1dabTdJ?=
 =?utf-8?B?cVBJWUFSWlRIdHh4VFU2d0kxTUdwL1M3aVoycnoxVytNWk1MbzJRTiticGww?=
 =?utf-8?B?K3hGNkZCU3RQWC9WenhLM0xSMFlNVlBMS2RiUnN6K3VmY2lvSS94MmdRWjc4?=
 =?utf-8?B?RlFJSmpoajhNUU4zVkxLc25VbVBXREh5Mkp2azdwVTV1U29VK3I1dzQ1MXl6?=
 =?utf-8?B?c0E0Q3R2Y2JjYks1ZkFpS05aa25hUFYwc2hnaHlaNml6NCtTSG81RWdCRm5k?=
 =?utf-8?B?aDQ2NURJUGVWZGUzaGlycmdjUEg5aU5rOVdwbnJLMWpUc1RrTWc2RElEd1Nx?=
 =?utf-8?B?TnNoRVZOUWZNa2w1WkVuVHFyRkZZaHBSL2hUcms2U1pERllYRUtzRndaOXJZ?=
 =?utf-8?B?VGdTZy91MFptbHMxV1pNU3U5eFYrM2FwSnllYWd1ZTdMSGJpVjZJM1BKRUFJ?=
 =?utf-8?B?TXp5dzU3b2tXQ0dMNW1OdG5uWmJhZDUyVnNZcXczNXMyb1JJL2dsZXE0bHlQ?=
 =?utf-8?B?UUI3N0Z5T2NBanV4RU5vaTAyOU9SR3UwdWVVZTVjT3ZuTTRUaTZNQ3dmUEk4?=
 =?utf-8?B?eittRGtQVFBGVTVGQ1Q0K1ZUZm9nZWdFc0ptNFJFVHEvM3RqanRHWEFxcG1N?=
 =?utf-8?B?YmlMdGhSeUw1SnVOY21lMDlhQjF6NzNXTGllM0pLZnlCdDdQd3k3b2VtdDJs?=
 =?utf-8?B?VWpmNmJlMlkydlJYaytudjVYbVFRbmVaMWRXeDhYc2FRY1FacExuK2t6UFhG?=
 =?utf-8?B?M3dzdCtDbG56TU40UzZlSTIyOHlxTUdCWFdwNkxIYzgva3g2NVhKQWtWRWxm?=
 =?utf-8?B?NS9lK2FnRjUwZUZvYmRCc1ZyaFhQT3IrckI3dXV4bWxxdFpGZjBOWTdOSkov?=
 =?utf-8?B?S2NLWDdqcGdBNDBBYVZpdnlMOVV5OU1ENy9GV2tSbGVvb1IwclgzVTdKNjJ3?=
 =?utf-8?B?WTBnWlkwWFNsT3llbWRqTjlQbUVXMWY1MWhBeXNDT2pxZUxyYkxlQjh4MFV0?=
 =?utf-8?B?QWVSSVprdHk0NVhyczJEclo4Z1VkSkJpWE1uRk91UDA5UGlrRUJuRk9ndU00?=
 =?utf-8?B?dkxyT0F0NVZoZXpoYVNCOGJaVnl2WENmTktIa2d1NVVjMHZralhCRG5TY3VK?=
 =?utf-8?B?YmIwejRqYmVwTlh3cy9SdFFkWkVha3hnZVNoMS9ldEFkMlBkZDROMFh2Q3VB?=
 =?utf-8?B?cmNyUHMrNU1aTy9WcjhGa0p5Rng0eHdrL05XZXlER0hoL0o3VVZwaHZNVW1O?=
 =?utf-8?Q?CY1OR7JZJ/bDorqS3XjTQcVL94Hkr5RKwjt+2P9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e312c61-01f0-4ad5-3803-08d971da2bf4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:33:30.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lSh2h1WW40Igaz0NBp81Oei5QcOM9qOHMvazOVgN0i/on/mn5anHZjSYiwJRtt7HAgbBK5JkgE0EK6B7q3Vlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 07.09.2021 08:52, Luca Fancellu wrote:
> Add a design describing a proposal to improve the EFI
> configuration file, adding keywords to describe domU
> guests and allowing to start a dom0less system.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  docs/designs/efi-arm-dom0less.md | 105 +++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 docs/designs/efi-arm-dom0less.md
> 
> diff --git a/docs/designs/efi-arm-dom0less.md b/docs/designs/efi-arm-dom0less.md
> new file mode 100644
> index 0000000000..8d8fa2243f
> --- /dev/null
> +++ b/docs/designs/efi-arm-dom0less.md
> @@ -0,0 +1,105 @@
> +# Xen EFI configuration file
> +
> +The current configuration file used by Xen when it is started as an EFI
> +application is considering only the dom0 guest and doesn't have any
> +property to describe and load in memory domU guests.
> +Hence currently it's impossible to start a dom0less system using EFI.
> +
> +# Objective
> +
> +This document describes the proposed improvement to the Xen EFI
> +configuration file to list properly both the dom0 guest and the domU
> +guests as well.
> +The final goal is to be able to start a dom0less system using EFI.
> +
> +# Current Xen EFI configuration file
> +
> +The current configuration file is described by the documentation page
> +https://xenbits.xenproject.org/docs/unstable/misc/efi.html.
> +
> +Here an example:
> +
> +```
> +[global]
> +default=section1
> +
> +[section1]
> +options=console=vga,com1 com1=57600 loglvl=all noreboot
> +kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
> +ramdisk=initrd-3.0.31-0.4-xen
> +xsm=<filename>
> +dtb=devtree.dtb
> +```
> +
> +# Proposed improvement
> +
> +The proposed improvement to the current configuration file is the
> +introduction of new keywords to describe additional domUs.
> +
> +Here follows the proposed new keywords:
> +  - domu#_kernel=<kernel file> [domU command line options]
> +    - Mandatory kernel file for the domU#
> +  - domu#_ramdisk=<ramdisk file>
> +    - Optional ramdisk file for the domU#
> +  - domu#_dtb=<dtb file>
> +    - Optional dtb fragment file for the domU#, it is used for device
> +      assignment (passthrough).
> +  - domu#_property=cpus=2
> +    - Properties that should be added to the dtb in the domU node to
> +      properly describe the domU guest. Refer to the documentation:
> +      https://xenbits.xenproject.org/docs/unstable/misc/arm/device-tree/booting.txt,
> +      section "Creating Multiple Domains directly from Xen".
> +
> +For all the keywords above, the # is a number that uniquely identifies
> +the guest.
> +The keywords domu#_kernel, domu#_ramdisk, domu#_dtb are unique, therefore there
> +must not be specified the same keyword twice in a section.
> +The # number is not enforcing any domid, it is just used to link each property
> +to the right guest, so there can be domu1_* guests that are started with domid 2
> +and so on.
> +
> +The domu#_property can appear multiple times and it specifies an additional
> +property to be listed in the domU node inside the device tree, Xen will
> +not check if the same content is specified multiple times.
> +
> +There are some property whose name starts with an hash symbol (#address-cells,
> +#size-cells), in this case the line will be considered as a comment, so to
> +specify them, they have to be listed without the hash symbol, the documentation
> +will be updated as well to see the implemented handling of these special
> +properties.
> +
> +# Example of a configuration file describing a dom0less system
> +
> +The following configuration file is describing a dom0less system starting two
> +guests.
> +
> +```
> +[global]
> +default=xen
> +
> +[xen]
> +# Xen boot arguments
> +options=noreboot console=dtuart dtuart=serial0 bootscrub=0
> +# Xen device tree
> +dtb=devtree.dtb
> +
> +# Guest 1
> +domu1_property=address-cells=2
> +domu1_property=size-cells=2
> +domu1_kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
> +domu1_property=cpus=1
> +domu1_property=memory=0xC0000
> +domu1_dtb=domu.dtb
> +
> +# Guest 2
> +domu2_kernel=Image-domu2.bin console=ttyAMA0 root=/dev/ram0 rw
> +domu2_property=cpus=2
> +domu2_property=memory=0x100000
> +domu2_property=vpl011
> +```

I'd like to suggest a different scheme, not the least because I expect
the individual domains being independent of e.g. hypervisor command
line options or Dom0 kernel versions. Yet varying sets of these are,
for example, a reason to have multiple sections in the current scheme.
Every dom0less guest would then require spelling out in every such
section. Hence I think we'd be better off having a section per guest:

[guest1]
kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
property=cpus=1
property=memory=0xC0000
dtb=domu.dtb

These sections would then be referenced by other sections, e.g. by a
new "guests" (or "domus", but this ends up looking a little odd for
its matching of an unrelated latin word) keyword:

guests=guest1,guest2

If it is deemed necessary to make sure such a section can't be
(mistakenly) used to create Dom0, such sections would need identifying
in some way. Presence of property= (or, as per below, properties=)
could be one means (allowing an empty setting would then be desirable).

As to the properties, is there anything wrong with having them all on
one line:

[guest1]
kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
dtb=domu.dtb
properties=cpus=1 memory=0xC0000

(just like is the case for options=)?

Jan


