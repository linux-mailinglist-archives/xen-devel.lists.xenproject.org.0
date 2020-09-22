Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC82744F7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 17:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjrd-0002VM-1A; Tue, 22 Sep 2020 15:05:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKjrb-0002VH-6e
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 15:05:51 +0000
X-Inumbo-ID: 2bda98f4-05da-4f9d-a935-41cad98b211c
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bda98f4-05da-4f9d-a935-41cad98b211c;
 Tue, 22 Sep 2020 15:05:49 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a22so14377977ljp.13
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=u7voX02Fi9E7M1ZUqOu5pDZtQqnlcjlWaDObWxL6Z4M=;
 b=q9lasXJ2ibWi+hAE2Rubg9Z/ApymDkia6dA3zSdZB8/ohpf0xhOh4Pqt5gk46J3PtR
 UuMyS5eOs1rsd4Zh0Xg/tXwdKIt64Zlv+x+nuf/IAmVl7usi0n7dJ9rHOU0XlgJoWWkL
 OBfKB+gxfEIKMgkw6DTj3DdCPJnl0Ry7GX1d0fYwTCmFeK8uT84dfY2HUbNMduHw68tV
 m2aqim6WRI7HYLscHu6RuzwivLHZwnUzBQXwyLJ8X8oKbfRNtZtURA4ZS5dXfEP0WJv5
 oM/TePW9K4RnCY9R2FF0iD3DKGn3FxijbxxgoJirEMIj4oPy+18z6+XytLCQqxi0/gfl
 uxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=u7voX02Fi9E7M1ZUqOu5pDZtQqnlcjlWaDObWxL6Z4M=;
 b=ZPYR+J9RJQl1X6anqwZ75f9f1HjoKz7R+VsWX5wbGGWsAYH4gNaraSND22Jq2Lol5Q
 uuClSrarIO4Zv1LjnjS/RiS9uaB5TRtq/6vs+12gAMuRfWE5zZFYFSUPtAQsWivI7DT7
 RScJ8YLZ5JWX2mVt1r/Pom0W3CZsH0XJGIanH2siCjF7IvkuAmB07WnHuN5TZzEU+Gdq
 tlWHzQjLJD+aADTn/a0Vn16bPFuh3Zw2yKFFOgwOQDnhLh9ocmes1q1sAqRiFNWheb2h
 lqs37Az1nATqZQPvwgjm1hbLt3brFcIDoTzKRLhcdUIvspN+gUmpEqGIKceQeHASSrd2
 LtOA==
X-Gm-Message-State: AOAM532B+Qt7t8GJfwuJP99/tuyV0/o8k6n6bW2SR7vo7k5NEOhmCohr
 ce90sf8tZHtJi5dG4H70s7M=
X-Google-Smtp-Source: ABdhPJwZFaSJJG/6IX4QaK9pCeM68TP8ZVWfqsIQUv1GG0IETvG5sgQdV3q2CJDXp+JHIqcmE15uaw==
X-Received: by 2002:a2e:8895:: with SMTP id k21mr1633188lji.418.1600787148331; 
 Tue, 22 Sep 2020 08:05:48 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v17sm3591544lfr.42.2020.09.22.08.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 08:05:47 -0700 (PDT)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
 <bf128337-699f-5942-b387-aa896000700c@suse.com>
 <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
 <d7d6d211-1a24-b452-d1ea-efb0105995b7@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7bffd6ec-8c41-202a-655d-df2240c1491a@gmail.com>
Date: Tue, 22 Sep 2020 18:05:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d7d6d211-1a24-b452-d1ea-efb0105995b7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 22.09.20 13:54, Jan Beulich wrote:

Hi Jan

> On 22.09.2020 11:58, Oleksandr wrote:
>> On 22.09.20 09:33, Jan Beulich wrote:
>>> On 21.09.2020 21:02, Oleksandr wrote:
>>>> On 14.09.20 17:17, Jan Beulich wrote:
>>>>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>>>>> +#define GET_IOREQ_SERVER(d, id) \
>>>>>> +    (d)->arch.hvm.ioreq_server.server[id]
>>>>> arch.hvm.* feels like a layering violation when used in this header.
>>>> Got it. The only reason why GET_IOREQ_SERVER is here is inline
>>>> get_ioreq_server(). I will make it non-inline and move both to
>>>> common/ioreq.c.
>>> Which won't make the layering violation go away. It's still
>>> common rather than per-arch code then. As suggested elsewhere,
>>> I think the whole ioreq_server struct wants to move into
>>> struct domain itself, perhaps inside a new #ifdef (iirc one of
>>> the patches introduces a suitable Kconfig option).
>> Well, your advise regarding ioreq_server sounds reasonable, but the
>> common ioreq.c
>> still will have other *arch.hvm.* for both vcpu and domain. So looks
>> like other involved structs should be moved
>> into *common* struct domain/vcpu itself, correct? Some of them could be
>> moved easily since contain the same fields (arch.hvm.ioreq_gfn),
>> but some of them couldn't and seems to require to pull a lot of changes
>> to the Xen code (arch.hvm.params, arch.hvm.hvm_io), I am afraid.
>> Or I missed something?
> arch.hvm.params, iirc, is an x86 concept, and hence would need
> abstracting away anyway. I expect this will be common pattern:
> Either you want things to become generic (structure fields
> living directly in struct domain, or at least not under arch.hvm),
> or things need abstracting for per-arch handling.
Got it.

Let me please clarify one more question.
In order to avoid the layering violation in current patch we could apply 
a complex approach.

1. *arch.hvm.ioreq_gfn* and *arch.hvm.ioreq_server*: Both structs go 
into common struct domain.

2. *arch.hvm.params*: Two functions that use it 
(hvm_alloc_legacy_ioreq_gfn/hvm_free_legacy_ioreq_gfn) either go into 
arch code completely or
     specific macro is used in common code:

    #define ioreq_get_params(d, i) ((d)->arch.hvm.params[i])

    I would prefer macro than moving functions to arch code (which are 
equal and should remain in sync).

3. *arch.hvm.hvm_io*: We could also use the following:

    #define ioreq_get_io_completion(v) ((v)->arch.hvm.hvm_io.io_completion)
    #define ioreq_get_io_req(v) ((v)->arch.hvm.hvm_io.io_req)

    This way struct hvm_vcpu_io won't be used in common code as well.

    Are #2, 3 appropriate to go with?


Dirty non-tested patch (which applied on top of the whole series and 
targets Arm only) shows how it could look like.


diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 2e85ea7..5894bdab 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -194,7 +194,7 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu 
*sv, ioreq_t *p)
  bool handle_hvm_io_completion(struct vcpu *v)
  {
      struct domain *d = v->domain;
-    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
+    ioreq_t io_req = ioreq_get_io_req(v);
      struct hvm_ioreq_server *s;
      struct hvm_ioreq_vcpu *sv;
      enum hvm_io_completion io_completion;
@@ -209,14 +209,14 @@ bool handle_hvm_io_completion(struct vcpu *v)
      if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
          return false;

-    vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
+    io_req.state = hvm_ioreq_needs_completion(&io_req) ?
          STATE_IORESP_READY : STATE_IOREQ_NONE;

      msix_write_completion(v);
      vcpu_end_shutdown_deferral(v);

-    io_completion = vio->io_completion;
-    vio->io_completion = HVMIO_no_completion;
+    io_completion = ioreq_get_io_completion(v);
+    ioreq_get_io_completion(v) = HVMIO_no_completion;

      switch ( io_completion )
      {
@@ -227,8 +227,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
          return ioreq_handle_complete_mmio();

      case HVMIO_pio_completion:
-        return handle_pio(vio->io_req.addr, vio->io_req.size,
-                          vio->io_req.dir);
+        return handle_pio(io_req.addr, io_req.size,
+                          io_req.dir);

      default:
          return arch_handle_hvm_io_completion(io_completion);
@@ -247,7 +247,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct 
hvm_ioreq_server *s)
      for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
      {
          if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
-            return _gfn(d->arch.hvm.params[i]);
+            return _gfn(ioreq_get_params(d, i));
      }

      return INVALID_GFN;
@@ -279,7 +279,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct 
hvm_ioreq_server *s,

      for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
      {
-        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
+        if ( gfn_eq(gfn, _gfn(ioreq_get_params(d, i))) )
               break;
      }
      if ( i > HVM_PARAM_BUFIOREQ_PFN )
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 0e3ef20..ff761f5 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -21,6 +21,8 @@ struct hvm_domain
      uint64_t              params[HVM_NR_PARAMS];
  };

+#define ioreq_get_params(d, i) ((d)->arch.hvm.params[i])
+
  #ifdef CONFIG_ARM_64
  enum domain_type {
      DOMAIN_32BIT,
@@ -120,6 +122,9 @@ struct hvm_vcpu_io {
      unsigned long       mmio_gpfn;
  };

+#define ioreq_get_io_completion(v) ((v)->arch.hvm.hvm_io.io_completion)
+#define ioreq_get_io_req(v) ((v)->arch.hvm.hvm_io.io_req)
+
  struct arch_vcpu
  {
      struct {
(END)


>
>>> This goes
>>> alongside my suggestion to drop the "hvm" prefixes and infixes
>>> from involved function names.
>> Well, I assume this request as well as the request above should be
>> addressed in the follow-up patches, as we want to keep the code movement
>> in current patch as (almost) verbatim copy,
>> Am I correct?
> The renaming could imo be done before or after the move, but within
> a single series. Doing it (or some of it) during the move may be
> acceptable, but this primarily depends on the overall effect on the
> patch that this would have. I.e. the patch better wouldn't become
> gigantic just because all the renaming gets done in one go, and it's
> hundreds of places that need touching.

Got it as well.

Thank you for the explanation.

-- 
Regards,

Oleksandr Tyshchenko


