Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c+SnGvk6RmqUMQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:18:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29D46F5C66
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:18:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fLJTXEAf;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1351585.1608720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfEUo-0004K3-RH; Thu, 02 Jul 2026 10:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351585.1608720; Thu, 02 Jul 2026 10:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfEUo-0004I8-O8; Thu, 02 Jul 2026 10:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1351585;
 Thu, 02 Jul 2026 10:18:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfEUn-0004Hz-CI
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:18:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfEUm-00DZBt-EL
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:18:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a463adf-e002-0a2a0a5209dd-0a2a4505c7e8-16
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:18:12 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a463ae4-3cb2-0a2a45050019-d1558035ddca-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:18:12 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so10695155e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 03:18:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef1807asm98365265e9.1.2026.07.02.03.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 03:18:11 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782987492; x=1783592292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asicmzSqEkS5SzRmJhqr3aSGxdsbzG03G4tjHfFmpH4=;
        b=fLJTXEAf3qxpwxXVfbVXy3b+q74oJLi1Ahbyk++jGXj9fwGAEee6Btgn4Ny0vb8snw
         yW58B/q+8WChiBQZ5TGJYwhamdFMoqRlHikUEQ/1u8uF0LW6IFJz8jssZzJ4S+SNZuV3
         tHHVdG9zH1Y6AWf29zi7tfDEc2LDNTbf3e+Bb4mpGpMwcnWuSzLzNbTOhUob4mjPL4B2
         arZwBv96mykDz70MkR806gD+ZbC0accZmsZH95LPOhmZR2zfwtLFVDhYKKVG2Gb/i++D
         j5zTvRTASELiW+VuVdvpCpBKVHiQ61e/7VtPaDPcyOdigqYCdv46ovh//yBh8uk9sq0p
         +v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987492; x=1783592292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asicmzSqEkS5SzRmJhqr3aSGxdsbzG03G4tjHfFmpH4=;
        b=SQU6mBj7b69DsItTNokS5LNaFp/+mey38nkKk+PC19x8xcDbep4LHjP/vCMuyOzER4
         pbypRHng0eUeOgYnbT+F5Et39DurNKvmrXO4b6TzD621Sz1uQlrdagPMMXZX0i6UgOLx
         PVM+nNzD2rvRnppcjzNcrm1I1em5XJgXBoGAlHdfjIZq8p4Cu6aGDp0yet5II0ekF1wo
         UxLvBHjAlXtF7yVoN0IjIw9K7tNF6mxLe0vgkCHFm1sNGHrbaf/EQkQsaqZn9q0kkiom
         92ERduibwXkGEMMupd/Z2kcDqKrk8Xdk5pujJmR/BiUP/BHudlviB8ZGAqNbp7G9OVfO
         JBQA==
X-Forwarded-Encrypted: i=1; AFNElJ9nPwH7G37RdPnHLLfNrWxTAjqVetyu08LtiSZezz4BSIgFHWfEmNFnuVrfy8wYtVtLubqHrhrY5i0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwdVfRSkATPCYI2FlGDCPE4ZMRJWPHG52E4oRanWQfFbIVejFI
	fM0/vK1HcT0LpgFyqNGiF/uxp4IPd5sGnrJwQT+tg844eJW1izTmrpNq
X-Gm-Gg: AfdE7cmgnzynZF3DdTIbWcNgKxiqn+gfp1WFehtqgFXnojCVc/muoTPP2pDGTkDCfMW
	nMh1Z+IUQURNPEOaGoLtn/gybj3uVC9T8xy2JsELjvxV4Sxk8BQoTFoEPR0LJD1En62wsgXZt5u
	Ye4G/X3ZtEt9iGiHA7Y2GDVrGl45QMI4CLF82dMRGyRy7w6elMBHzRCTVzeIRLJnodSQmLcxz3U
	8ReyoGsqfKkx5f4j/eZYFdxAioeyLtbXKxdjjOZc59CxAQco79GqUTsKDbV7UEg7JPnFP5f7FIW
	gcZ7uVdTj6VZcDOE6Djvh1YmE+5/voqUtSpkS4ybvRZqHBG2K/UJHAMX8ZDRB1rJOJHQUbp3T3g
	+GDoeT/6FyMRRScmUWu0hs01DLjuTRUqB5+MmrbOaYOk7zq0JDNH5QfrG13g8d/xAKwwLXAGw3R
	GI43bjRIoNR96byap5XPrIAqEjjQTDF7ycHoGqcKtAzdu5kjRoV9S03YHAvKQyGhvb+7U=
X-Received: by 2002:a05:600c:5681:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493c3cd9c4cmr44809895e9.13.1782987491717;
        Thu, 02 Jul 2026 03:18:11 -0700 (PDT)
Message-ID: <1aeabffc-0087-4e59-a8ae-7cd20be4761d@gmail.com>
Date: Thu, 2 Jul 2026 12:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] lib: make safe_copy_string_from_guest() validate
 input
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>
References: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
 <80bc4e83-b767-4692-9ce1-0ebf68d7ab26@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <80bc4e83-b767-4692-9ce1-0ebf68d7ab26@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782987492-0FB192B8-AAFE3081/10/73395122804
X-purgate-type: spam
X-purgate-size: 4231
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C29D46F5C66



On 7/1/26 4:48 PM, Jan Beulich wrote:
> ... rather than papering over guest flaws: Strings passed ought to be nul-
> terminated (yet sadly libxc hasn't been doing so thus far). This way we
> also avoid order-1 allocations, seeing that all present callers pass
> PAGE_SIZE for max_size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I can't spot any caller side use of FLASK_DEVICETREE_LABEL, hence there's
> no corresponding prereq patch.
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,8 @@ The format is based on [Keep a Changelog
>   ## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> + - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
> +   string sizes need to include the nul terminator.
>   

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # Changelog

>   ### Added
>   
> --- a/xen/lib/guest-strcpy.c
> +++ b/xen/lib/guest-strcpy.c
> @@ -3,8 +3,8 @@
>   #include <xen/err.h>
>   
>   /*
> - * The function copies a string from the guest and adds a NUL to
> - * make sure the string is correctly terminated.
> + * The function copies a string from the guest and checks there's a NUL
> + * terminating the string.
>    */
>   char *safe_copy_string_from_guest(XEN_GUEST_HANDLE(char) u_buf,
>                                     size_t size, size_t max_size)
> @@ -14,8 +14,7 @@ char *safe_copy_string_from_guest(XEN_GU
>       if ( size > max_size )
>           return ERR_PTR(-ENOBUFS);
>   
> -    /* Add an extra +1 to append \0 */
> -    tmp = xmalloc_array(char, size + 1);
> +    tmp = xmalloc_array(char, size);
>       if ( !tmp )
>           return ERR_PTR(-ENOMEM);
>   
> @@ -24,7 +23,12 @@ char *safe_copy_string_from_guest(XEN_GU
>           xfree(tmp);
>           return ERR_PTR(-EFAULT);
>       }
> -    tmp[size] = '\0';
> +
> +    if ( !memchr(tmp, 0, size) )
> +    {
> +        xfree(tmp);
> +        return ERR_PTR(-EMSGSIZE);
> +    }
>   
>       return tmp;
>   }
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -574,7 +574,7 @@ struct xen_domctl_assign_device {
>               uint32_t machine_sbdf;   /* machine PCI ID of assigned device */
>           } pci;
>           struct {
> -            uint32_t size; /* Length of the path */
> +            uint32_t size; /* Length of the path, including nul terminator */
>               XEN_GUEST_HANDLE_64(char) path; /* Path to the device tree node */
>   #ifdef __XEN__
>               struct dt_device_node *dev; /* Resolved device node of the above */
> --- a/xen/include/public/xsm/flask_op.h
> +++ b/xen/include/public/xsm/flask_op.h
> @@ -26,7 +26,8 @@ typedef struct xen_flask_setenforce xen_
>   struct xen_flask_sid_context {
>       /* IN/OUT: sid to convert to/from string */
>       uint32_t sid;
> -    /* IN: size of the context buffer
> +    /*
> +     * IN: size of the context buffer, including nul terminator
>        * OUT: actual size of the output context string
>        */
>       uint32_t size;
> @@ -86,8 +87,11 @@ struct xen_flask_boolean {
>       uint8_t new_value;
>       /* IN: commit new value instead of only setting pending [SET] */
>       uint8_t commit;
> -    /* IN: size of boolean name buffer [GET/SET]
> -     * OUT: actual size of name [GET only] */
> +    /*
> +     * IN: size of boolean name buffer [GET/SET]; must cover nul terminator
> +     *     if "name" (below) is an input
> +     * OUT: actual size of name [GET only]
> +     */
>       uint32_t size;
>       /* IN: if bool_id is -1, used to find boolean [GET/SET]
>        * OUT: textual name of boolean [GET only]
> @@ -150,7 +154,7 @@ typedef struct xen_flask_relabel xen_fla
>   struct xen_flask_devicetree_label {
>       /* IN */
>       uint32_t sid;
> -    uint32_t length;
> +    uint32_t length; /* length of the path, including nul terminator */
>       XEN_GUEST_HANDLE(char) path;
>   };
>   typedef struct xen_flask_devicetree_label xen_flask_devicetree_label_t;
> 

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


