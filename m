Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BAyNwKu3GnfVAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 10:49:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D783E953C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 10:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1280945.1564027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCCyT-0007NK-A5; Mon, 13 Apr 2026 08:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1280945.1564027; Mon, 13 Apr 2026 08:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCCyT-0007KZ-6s; Mon, 13 Apr 2026 08:48:53 +0000
Received: by outflank-mailman (input) for mailman id 1280945;
 Mon, 13 Apr 2026 08:48:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCCyS-0007KT-FQ
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 08:48:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCCyR-00Bcm9-R8
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 10:48:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dcadf1-2eae-0a2a0a5409dd-0a2a45048b8c-6
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 10:48:51 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dcadf3-bb33-0a2a45040019-d1558030dd26-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 10:48:51 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso51009365e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 01:48:51 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d58bb830sm288502705e9.7.2026.04.13.01.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 01:48:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776070131; x=1776674931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBPueUyGFRga8AEhs67/Xn6+SE364MXzEAQfF5xNnc0=;
        b=lfMdUZKLOJo+kaCvxB6THHfP4DzSridQMKquv0YS4ceDmo9bZxJ5kVhD573l9kge1E
         krPOuThc1wcUEf/VenzcW0JJ1E4zb+TL8v++VhvhVdx+6Nj/Ly6UIS8OfK9UZrxTsDvs
         K8xbgfNVn7uzIiDVb7As2f2f+zEiE9htBLGBzf3D7GpM8bHmevgRUE57b87+dpg/3U0F
         GQPEpC3FxCVvIiQi/qYqAT8UkAEnh5JcHiDgyXaMzvfe4CfxZ1x+3T4KyjJIxahc99BL
         ZgFz7cNaieE+o30kwzCco49faVCBoY3ZWzq7Z/Tljhw+g67I9Pz2QVIeZ9evgsx28NmN
         X3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070131; x=1776674931;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBPueUyGFRga8AEhs67/Xn6+SE364MXzEAQfF5xNnc0=;
        b=Xf/+e4m4q7fKsZpKx0Es69CPnS2xsKSQqbVXbGT0nv5wg0grVUvLU4Rh51Lw19uGgZ
         G2lVBbLjYG06pzZB8rPn/XAV2UOCOoH9peNwUn7u41axBSkFNHSC5lsdDjlQjB5CE/KY
         i7SsDWXUbJm88IMfb7cxFxyA7bMbn4JS/V/q8dyrfHpkJmmmQApNWQg2k1bfJie21Jel
         vxsTnb2VjT9d4WZRzdwFlwzt+zruhp9ZzxXEdYkwowjDSp3uvi+4UCIS53ptg9stz8Gv
         7IB0+8zD+ZQyUaJJXwgBpMVFppTOXRHplA2wkekU/gMGF5TUDEODOn7bpf5Y9fH/7BKH
         skSA==
X-Forwarded-Encrypted: i=1; AFNElJ+jERDO8G2R0oqChLYS8LmfEYi+zLdsC9uQfs5SK4lyLyct9dYxGHJKF4EXEE8zEwFoAwPt6aA/WgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0TH2IfC83htQk+qQ0qpIWTaVmfj9LlQh82r90fDCrmm+hWCOo
	HAUHeU3RIsCkWfdkCTeBzlimmU6R8Wg4e03YmbVbgaO7soIxr7m4fX30
X-Gm-Gg: AeBDiesT/046v/heXFAiQJNzlev99rb0+X+1ec80i+Yh57Wp7VLaOD4VO5k0HIg9PBc
	kpYD+z0+Z8s/5CIs2U89VdyaD4H+cZul1qplkUot5P0w3BHdKkhxfzK10dE9BglGq4spztGarFP
	FmBs2cCep1vQrLeqnyV/SvNAGkMIqef/i15z5zpkfbhTwpDfXlbxKxXIjC8fpl71/CHKFZPjQU/
	fKC7FoZU24j0XV0jNn8wxBgCA1qVINYh6fAgPh4OmJN6e+D+h7JaeNhhP2Qn99idfk7uzxgH79h
	JiCn/zExho3cEMXHpTDM3hooGaTflWBv2jO8vScxFYiH2zozN//QQe7XekqgeKD/0KlImYPM+gN
	3stfuLUmpGyXgCkv16qO0bu/lyMcCypzjQfvmrT6zAz/cWIX5OlyiUKqBO78A3161MKbRXyY1F2
	9HJc01xrthT+lBAGxTt9RNx7KfBX+gi96iRKfkd7yILm+AHz3eZCROrs3wTewuooocnyPH98Alg
	k6gz9XFSRZyYg==
X-Received: by 2002:a05:600c:34cc:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488d67d882cmr177827655e9.8.1776070131088;
        Mon, 13 Apr 2026 01:48:51 -0700 (PDT)
Message-ID: <004619ae-2b07-4ca0-bbd6-b023b5351f01@gmail.com>
Date: Mon, 13 Apr 2026 10:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/27] xen/riscv: create APLIC DT node for guest
 domains
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
 <362d1e3a-409c-40ab-8d2c-36dc30a04b88@suse.com>
 <9fd04b0f-3b04-4f1e-ac63-de0fca57d466@gmail.com>
Content-Language: en-US
In-Reply-To: <9fd04b0f-3b04-4f1e-ac63-de0fca57d466@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776070131-3353351B-EC74DD9A/10/73395122804
X-purgate-type: spam
X-purgate-size: 863
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 96D783E953C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/13/26 10:43 AM, Oleksii Kurochko wrote:
>>> +        return res;
>>> +
>>> +    data = dt_get_property(aplic_node, "#interrupt-cells", &len);
>>> +    if ( !data )
>>> +    {
>>> +        printk("%s: Can't find '#interrupt-cells' property\n",
>>> +               aplic_node->full_name);
>>> +        return -FDT_ERR_XEN(ENOENT);
>>> +    }
>>
>> Again, pull this up to be first in the function?
> 
> Agree, it makes sense to move it up.

But on other hand, there are several time used the same construction 
dt_get_propety() from host aplic node then write this property to guest 
aplic node, then maybe we want to keep this dt_get_property(aplic_node, 
"#interrupt-cells", &len); where it is now to have the same visually 
construction way of guest device tree properties.

~ Oleksii

