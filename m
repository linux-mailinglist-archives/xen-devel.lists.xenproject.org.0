Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F0C83726
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171595.1496611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmOL-0001hv-Oh; Tue, 25 Nov 2025 06:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171595.1496611; Tue, 25 Nov 2025 06:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmOL-0001fR-M9; Tue, 25 Nov 2025 06:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1171595;
 Tue, 25 Nov 2025 06:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmOJ-0001QO-UI
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:19:07 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a51d0da6-c9c6-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:19:06 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so35765765e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:19:06 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479040cfe17sm10996785e9.5.2025.11.24.22.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:19:04 -0800 (PST)
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
X-Inumbo-ID: a51d0da6-c9c6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051545; x=1764656345; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X30FMRBV6rs2CIsf7r6Mx7FRlGfIzbGDOF+dbbDNFAg=;
        b=KhgVTdmF8OKtnGCYTlWC5DKvpQMzGu5j35h8sKEEUcdEG9K2LO9kkr7+dvS38Q+v20
         fIaHOk6CzmOa+jVnCJPtnTCg62Iq9fOoCs/PyqO2x3JUk3I2ZLy+Eu2L0JnKXKxRKtGy
         7R9SyByK5H/rPhqn2OEQi149+GERAx8+Rqj3m3qtojY+nGJ5I7mQiRi/JTVOwf1WEHli
         5GngSac6EHis7iO0xOhxrelDwhrKIbbuNUlTCFcD+JgdTU2t1yFz4H5PUohLIWz1mWL5
         HOYNABM25tIJTa8KTDLPokw8nEemyqn6jgJAtXshleWbbvDLUv4QVnclT+wjIgw0UQZf
         atvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051545; x=1764656345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X30FMRBV6rs2CIsf7r6Mx7FRlGfIzbGDOF+dbbDNFAg=;
        b=IZDxojzfGga2OyeFZESYdvf9OvltPN8yZQWwDIMtCTbsIJEFrTVrO0Na9N88W184h7
         2p/8Dt3cyyZHW7CUW5eaXM0B2+2fWFT0iLqHNeujN9qEDIpcam69dg4C+ddyVdn6JWDp
         i9ROPX38W5sAH3fdT6R6BH40MoLgdN1VfrF6ppkcye6wFoyO2EhLXWjlD2aJzDgwoGrC
         sShQeHpyKubQttROaSHy95K76lh/nUhloVI8uFBsr8XLPBw3TPOojVsI6wlq3fG1zklz
         NHrXDOGW9rtRXtjZ3RQRzbkBL/sZfYh+m/ftooIsVpA4tbp1OXizI6UCxwyk4APBUBPe
         0I1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoVIv6U2urqf/lLZijard+HbPt9B1PTG6fx9+oGe+rK8lBqtEhSGv9/wSRZBZkJ0iaK3h8TW7+8o4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPldSWoNj1Q4+iP38Z3uAR7GsfIPw/04quZn78fv9QxvI0kNaj
	DGLtMoi3KKKDvkZgZKI0Fn5tglwluj9E+wUZLuPqgJxC11oeVnPXau938neAr+mpKWw=
X-Gm-Gg: ASbGncubzeK34wfm1nBPljke0tr3vSfgvEzn2G+XpivlSx+MQZb6u/FlN0XsPgWWXw2
	ul12JapwPO6kYCW99dyjc2hw89YIO9PeYYV/NcoqtHHDM7oze7g/7G4CgXvtXbIMyiTWPB7GPjh
	qX9Sdtje6IqlE0BdeKkXSOwxPRjp11vtfvQsE/hUVT+W216mob7HMyg6OR+cPwx9smA+9oSc91p
	vuc04JxJkgBc48JUn8H18R75XkiLbm6icjAarOoqQIzIpCQGw+NloK3Jq6+NqiRNoLba+6KtPii
	utoAou1EmhMAcYaHTt5QdQfbDCI1Ned+5Ls/PZDATnRceQGMQlq7ZvnHkd1uMl+c8gLHzzJfsqD
	8E3afujge0gLq9n6zNsVrtonrRmuIr9Q8RhCME70feDG9W9iQ6tDem5DCpO2DxQdvWAHTS8qguV
	YzobTFIFjMW9ZQ8q+DN3ELUwR6yO2gG0pbVw96fRBxVbMwFCVZ5AgYIw==
X-Google-Smtp-Source: AGHT+IEAS/g3YIxold2M9P/q5H77arLENsXrfrsPawoV7IMsBeDbBm6FxQuMeLBU7nI1wau2acezwA==
X-Received: by 2002:a05:600c:c48e:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47904ac438bmr12859925e9.4.1764051545408;
        Mon, 24 Nov 2025 22:19:05 -0800 (PST)
Message-ID: <7a99da47-44fa-45cd-8cdc-60bef1fa9e60@linaro.org>
Date: Tue, 25 Nov 2025 07:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] hw/virtio: Use error_setg_file_open() for a
 better error message
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-8-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> The error message changes from
> 
>      vhost-vsock: failed to open vhost device: REASON
> 
> to
> 
>      Could not open '/dev/vhost-vsock': REASON
> 
> I think the exact file name is more useful to know than the file's
> purpose.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/virtio/vhost-vsock.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


