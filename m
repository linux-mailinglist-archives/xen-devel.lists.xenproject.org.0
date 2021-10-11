Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8484291A5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206115.361607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwAW-00050X-G5; Mon, 11 Oct 2021 14:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206115.361607; Mon, 11 Oct 2021 14:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwAW-0004xo-Ck; Mon, 11 Oct 2021 14:20:44 +0000
Received: by outflank-mailman (input) for mailman id 206115;
 Mon, 11 Oct 2021 14:20:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZwAU-0004xi-Lk
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:20:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69bfec4d-2a9e-11ec-80e0-12813bfff9fa;
 Mon, 11 Oct 2021 14:20:41 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-MLB6n8_XMRez0U8rOU2S-Q-1; Mon, 11 Oct 2021 16:20:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 14:20:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:20:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Mon, 11 Oct 2021 14:20:37 +0000
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
X-Inumbo-ID: 69bfec4d-2a9e-11ec-80e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633962040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sKjsAzvkK3m98dcMYZdfJ+I4/nNBXGKaM3Yto11X+Hg=;
	b=Hm4OzTWfm9qus31Zoj8R38Wz9ROk/qXVIxWK20Fd9F4XU6wRgxx1fUZNY/oScXo+RIOsvi
	tAvInwbodczHsfP2hDkZsjNOX5f7tMW+pLY+PKQ8ukOO3StrICq3SF5li7rXRu0rIQtTAu
	TnOIrSqrBSGUnwPv1VOHXZbX1PvWuOI=
X-MC-Unique: MLB6n8_XMRez0U8rOU2S-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMaXYitKugqM6uTU16il3hIE/Q6qiUbFnlPUGHMo7mwfOdCAFBno3vWksJbwTiitfMUtlGxv5HVNiF4hLRvoPFytHUtV3O9AJDxRmQUMcB+keljUoPYs/scYjQcjuAY/RgQ/zyaoGosWMRr848ki1Ob8nYBWhCe2uV87yjMvTEy37ZyUSRPh4LcfiAUKu+7Q+25PPsYh/uQQYuYhaqbnXK6Z9yMDsZyKntiZ6D33naJcWybEBmf3LqawTWq8AjWKtp/EhEYgA5rxqXNVsQPTH1YPm3+tvQFgPpZhZTKilZX4QE5cwX0zdZWW5JePRC7t+ayVtjf7GDBuOwXi7EvtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKjsAzvkK3m98dcMYZdfJ+I4/nNBXGKaM3Yto11X+Hg=;
 b=SuciyaoSMGlGIfot3WAA9tzgg6Qnqj4IW3HCWM3igecMIA5ww4W8slmyi8WVsONxZXtzOG0z3PlwccgJNHk861butY1Jm6coW3wvOFHN1JofY9WSvN8UUULQDhc053MYB/a0u80/SnH77ROgYFQX8oRue/RGlducOm2h0AOw29Yt23J0TdSNprL9B3I9qINEURmpXo1ti10Q60J3Rv9MOYFlJ7MmO2JIhqi2MJiXCIiEOi5TZo2WD9C6i3wU8y7mvEw/LxuAZzyUYlwB6p5m0REivFr3v2LYbPGgU0uzhBeJul3hpPyI65uEeFQXh5xdzB+v7QEs4rlgymPfcZLTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 27/51] build: introduce if_changed_deps
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-28-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a1fc8b7-b915-2092-19bd-89a58cf3f232@suse.com>
Date: Mon, 11 Oct 2021 16:20:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-28-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54ce9c29-794b-4352-8907-08d98cc24c31
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037C145FBB1D10E976D8173B3B59@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eKCvhyGPSOEv3Uvo8Yobvp9tbG7b81ti5j+DWU0LocT0rUwruL1HHEoUwPQ1G4bRA45wT3pX2v9UsR9G0AQPymKDFGQD75AddmWQ9hChUiZnYDlYBRlQteNbHfEa1hTjgu6L8gNqStBBpauNfg9ZSvZ9gByTPlTL3yxKhkGgnNJX74dt30VuPmONC0iX5EjKZ/ytMZu8mSZKOTqyMVqHUxOIAM0EmqMK3e00cUiel4Zt376jBm95A7NEkNVTggHbn57MXoNQXmEBKfYv6V1IG7lX+V+crx8C5TdAKooJNJQ/mQSs37y+JYuyZup+A+2YgSkCtDb+WsLKO5H7Dj8nIw2I1WMF6x2Bie6rmuSUGgNenm4H4fh9rJwupz+ZK/ZTzLQJNbPT+fZ2pkr+NJ/OiAnTKMuzsfNvrOypVRTRye73qr8FXyXglrHJ2NQPr2y5PtJkyHP5H98uTAknXnaY1Lz59asmofr1VThsskBqs91syJXcnwJw/V6GWhxvkmYimfDGwfd/2BjX09RXSiwDXRLSri+X/UgNkrMJ4abWq9gPRUHHeQi7XP7aq5BrUedghSzLTEerl3SzDZoJoD79RORbUJRlfWUKTLlT+v4dW12b9fmyUxPXv9joVbjBGgaDPyJEE1BKI2v5QYKgloEdJprmpsFTIUi0o1V12CotFnV5nR+Hml7vYcJa8o7gE0yGY9URNyqTjVHx7fmCwGZJkuwfJqUI8Rtgbc8A2FjwmJbOi4vV699ORXQ4BpqkCnKS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(53546011)(8936002)(36756003)(186003)(26005)(5660300002)(83380400001)(86362001)(8676002)(6486002)(38100700002)(6916009)(66556008)(16576012)(316002)(31696002)(66476007)(2906002)(2616005)(31686004)(956004)(54906003)(4326008)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0lHQ05SNmJwaGVqbjNyazhEdjZaVTU0dVRPLzBjRDM2UDJRV2tGLytJaVZH?=
 =?utf-8?B?ZWN4STFaeXIvNGx4eWVjTjZrajliN1MxRllSaGJaSnQrcVVNNmFJNEhERncw?=
 =?utf-8?B?c0t1d1BCaE9WcUN0SkZYTGJ4WGRoaFJ5bzhvNDJnTmFSRFRienFpZ1dqWHU3?=
 =?utf-8?B?bXgrZitBNnJoRW04WC9ha0dyamFxbjgwRWZxclVucE1mamRHbnRtaU9YS0dZ?=
 =?utf-8?B?RUtZNUhCcVppU3l3c3pTalJMTXVRWHk0TWxSQnFLZHkyRHBEY3p4UlUrQVA4?=
 =?utf-8?B?T1hhT1hwNHVvV1QxbU9pdU92TjRqUmVvT2FlUnlUUTgwRW01YWpZTTREdTJM?=
 =?utf-8?B?amYxVGI5OEtyZ0x3Y3dqRlFEcFFBSG5tZ1dQaFBiZVBNdXdlNllFTERuTXd5?=
 =?utf-8?B?ZHFnK2ZXbmZMNU1UMTBhZW9Ucm4rcnNnZUZXbmkrMXd6NjY5SVVPN2RxaDBV?=
 =?utf-8?B?eElvQ2s1bTc2ck45RUFPcWpKL0ZoL09NU2pjM2E1OW5mczEvMzczQXVkaXlJ?=
 =?utf-8?B?QmJxY2wrRmZFSFdvdVF2ZGJrbTZmbmlxeXBubkZIOVduOUNEWnpOdG1DR2Iy?=
 =?utf-8?B?azJicW5MUGpRRjNaVWRKRENRajJVb29CZGFHZVBMditnZXJuQ3dGZDEyc1M1?=
 =?utf-8?B?ZjVXQUtBVEh0NlFTWmF0NEtoMU4xZXFJS05BQUtGMDBYSjYzZWJBaUx0cUkx?=
 =?utf-8?B?bmczVkljR3ZyQTQzK2F3RXh0c3VIWHFqN25OdTBQeEJSZkkwTVpUaDZjME9B?=
 =?utf-8?B?aTdrYmRDUzlTTVJJaWZPUGNRc3ZnUUVObVdqVjRFVTROODV1dUZUU29vcXln?=
 =?utf-8?B?WEYvM2NFMUdPZmR5akZucmZORFM4cExpdXlldzBPTUp0OGNQMStBckF1OTVU?=
 =?utf-8?B?blVHdUl2NXpSa3dwYWt0eVhTT09SVmtYSDY1Z0llN04zU1B0dTlrcFRSQXlQ?=
 =?utf-8?B?K2lYRzBib3Y5WmxYMDVkWTRacHRiRDhqRWpKZXFCVjQyclZEbGJQc0VLM25S?=
 =?utf-8?B?MzIvbXczcmJINjZhU3ZFbkxjc3lETHZqbm5ES1JFUUlVVW4zSjZPeHZONWEy?=
 =?utf-8?B?RGlaUWxvakVFbjZrMzl6YzlQNWRnYXlZRFRQMTFUd09rQThzRVJTVHRCSFFC?=
 =?utf-8?B?UnAveVFua1RhM1A4ZnhEblFmTzV6N0dmajBJWjBYMFVvMDdvR3lyNkRNTk0z?=
 =?utf-8?B?cHEvWkNIVnA4Q2tTM0IyREdSM05ET1hmaTArNzluYUJmZTZEcXhBUHVwc0Vz?=
 =?utf-8?B?bUg5VlZhc0VwRDgyUVlJcWRJbDhEdWExWkNHWmUwU0NEb3c1TC9lWW1ZNlor?=
 =?utf-8?B?clFzakhEcUxKMy9FNW5qUW9jbmovMC9OdmtYQ1E5ZHlHcDlrWUs2MUpWbDZC?=
 =?utf-8?B?TUF2bkhtdlNhUlFhaUwvenRRbXNMRDlYODBqR0c1ZUpqR3F3NktjQW05YWQ1?=
 =?utf-8?B?TFJuL3JnMStiaDVUbDVqRktMUmRWSDBxbENKTy9BbjIzd2hxZmV1MXlCUWlS?=
 =?utf-8?B?amUwb2h2ZnRCZlhmUlord3N0aHR5NGpVM3o4YmZRc1BqUFNRZVdKODN3M1Zn?=
 =?utf-8?B?U1MrSFFtUVFxc3RpUE9BVTlwVE9WOW1JUllPMFhlRmpsenI4anFNRDdHTWJ2?=
 =?utf-8?B?UlcvMGMwaldjZGN1QWg0dmZWcGpBR0tpaWI2ZHduYXJlT29PSUpKNEl0Y2NM?=
 =?utf-8?B?TEdEaXplU25EUDNBMVovNWhKZkRacUNpLy94T0ZyOE5Qc0htTVFEeVpQV0FF?=
 =?utf-8?Q?/OyKifu4my1VssJ1Y8StXl1aRaQSCPt/c5LH0gL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ce9c29-794b-4352-8907-08d98cc24c31
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:20:38.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZv2ZQfT36a5wve3WXtSBFuCMm8NAvxQx5EhjPTfp3JE1QLBdYFHWJFejXShlVBuJrnQWcbBu7GAgzZM/cqGdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 24.08.2021 12:50, Anthony PERARD wrote:
> This macro does compare command line like if_changed, but it also
> rewrite the dependencies generated by $(CC) in order to depend on a
> CONFIG_* as generated by kconfig instead of depending on autoconf.h.
> This allow to make a change in kconfig options and only rebuild the
> object that uses that CONFIG_* option.
> 
> cmd_and_record isn't needed anymore as it is replace by
> cmd_and_fixdep.
> 
> There's only one .*.d dependency file left which is explicitly
> included as a workound, all the other are been absorb into the .*.cmd
> dependency files via `fixdep`. So including .*.d can be removed from
> the makefile.
> 
> This imports fixdep.c and if_changed_deps macro from Linux v5.12.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a question:

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -187,6 +187,13 @@ endif
>  export root-make-done := y
>  endif # root-make-done
>  
> +# ===========================================================================
> +# Rules shared between *config targets and build targets
> +
> +PHONY += tools_fixdep
> +tools_fixdep:
> +	$(MAKE) -C tools fixdep
> +
>  # Shorthand for kconfig
>  kconfig = -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)"
>  
> @@ -400,7 +407,7 @@ $(TARGET).gz: $(TARGET)
>  	gzip -n -f -9 < $< > $@.new
>  	mv $@.new $@
>  
> -$(TARGET): FORCE
> +$(TARGET): tools_fixdep FORCE
>  	$(MAKE) -C tools

Shouldn't this include building fixdep, in which case the extra dependency
here is unnecessary? I can see that it's needed ...

> @@ -457,13 +464,13 @@ cscope:
>  _MAP:
>  	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
>  
> -%.o %.i %.s: %.c FORCE
> +%.o %.i %.s: %.c tools_fixdep FORCE
>  	$(MAKE) $(build)=$(*D) $(*D)/$(@F)

... in cases like this one.

Jan


