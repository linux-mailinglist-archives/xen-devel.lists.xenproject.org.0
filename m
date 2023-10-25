Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C87D73AA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 20:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623171.970737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvj3l-0001hx-Ts; Wed, 25 Oct 2023 18:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623171.970737; Wed, 25 Oct 2023 18:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvj3l-0001g3-Pv; Wed, 25 Oct 2023 18:56:53 +0000
Received: by outflank-mailman (input) for mailman id 623171;
 Wed, 25 Oct 2023 18:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iZwN=GH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qvj3k-0001fx-6D
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 18:56:52 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 417fab26-7368-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 20:56:50 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-538e8eca9c1so43130a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 11:56:50 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gy5-20020a0564025bc500b0053d9cb67248sm9782173edb.18.2023.10.25.11.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 11:56:50 -0700 (PDT)
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
X-Inumbo-ID: 417fab26-7368-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698260210; x=1698865010; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JF5ca7+x0sfEieU/HtiRgSR4K9/JiGdvljdjrfAmMDg=;
        b=V2x3jDmgzDe6iqpCFj3gUicpfvhoHw+ckCKokgwcyx40SxDJh+yvR856l0mbSBgXyC
         2QLX7zLVxxsV8qu0ogBWQYLMubefE/Bn7/0ujonHWDyOGKl4xHmJcI6OvWr/2qC+Uvtp
         DjZ0irDG2U/Jl8nUfARW+P1mPXdcRMJXRbLFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260210; x=1698865010;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF5ca7+x0sfEieU/HtiRgSR4K9/JiGdvljdjrfAmMDg=;
        b=tzUY0BENQ47eolal3+Lu0/zCK2Q/ka0bjHNkgfmXC07k8iMyIz1wUN2NiMDJ9aDWQG
         sXuDJbgQB57FTawiUUjstUAwBlvXQCjk50Fu6Z5oNmRvZcy++DsroXFqLw0aCS/+QsRP
         3Jnqfww71AaBmvGABwMWwJuDdvdz2f9EmyHkofJMWckdBcmyrDbnYW66ZD28OsP2HHAP
         SvFW7Pbv3e9RgH6wr9Dthpi5mspqMYpoDTbC7nDBZCyL4GtHkrY/67cEGiSgeAb8+iRl
         DUwrla3A6q8U56lcVH8Jg08Pbq8U1fvvcZiqXTiMjolQU5soCoMrPDzFLuDWYVAbYoDu
         MLqg==
X-Gm-Message-State: AOJu0YzdiCr53bkwLIcvc+HDnioewmnoV7j1D9ZNQr2klAtp+SnK7nJ0
	iOh/LgGy8yJygI6OYX27rLg8LA==
X-Google-Smtp-Source: AGHT+IFxH1j7TKw+zrvE7NCB/3vXZZrLnWl0t3N2wKXEX65s3P/uyzFzibytV4tFS6LlcMIDzGoFgw==
X-Received: by 2002:a05:6402:5188:b0:53e:7eca:5650 with SMTP id q8-20020a056402518800b0053e7eca5650mr14140934edd.13.1698260210346;
        Wed, 25 Oct 2023 11:56:50 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FpeNP3Ap5IjP2UdppoSTSNsb"
Message-ID: <21e8a265-bf5a-464c-86bc-f0fd7b5eb108@citrix.com>
Date: Wed, 25 Oct 2023 19:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/28] docs: update Xen-on-KVM documentation
Content-Language: en-GB
To: David Woodhouse <dwmw2@infradead.org>, Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-29-dwmw2@infradead.org>
 <6vbpkrebc7fpypbv2t7jbs7m3suxwbqqykeomzfxpenjj2sogd@rphcppcl4inl>
 <4a10a50e5469480a82cb993dedbff10c3d777082.camel@infradead.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4a10a50e5469480a82cb993dedbff10c3d777082.camel@infradead.org>

This is a multi-part message in MIME format.
--------------FpeNP3Ap5IjP2UdppoSTSNsb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/2023 7:26 pm, David Woodhouse wrote:
> On Wed, 2023-10-25 at 13:20 -0500, Eric Blake wrote:
>> On Wed, Oct 25, 2023 at 03:50:42PM +0100, David Woodhouse wrote:
>>> +
>>> +Booting Xen PV guests
>>> +---------------------
>>> +
>>> +Booting PV guest kernels is possible by using the Xen PV shim (a version of Xen
>>> +itself, designed to run inside a Xen HVM guest and provide memory management
>>> +services for one guest alone).
>>> +
>>> +The Xen binary is provided as the ``-kernel`` and the guest kernel itself (or
>>> +PV Grub image) as the ``-initrd`` image, which actually just means the first
>>> +multiboot "module". For example:
>>> +
>>> +.. parsed-literal::
>>> +
>>> +  |qemu_system| --accel kvm,xen-version=0x40011,kernel-irqchip=split \\
>>> +       -chardev stdio,id=char0 -device xen-console,chardev=char0 \\
>>> +       -display none  -m 1G  -kernel xen -initrd bzImage \\
>>> +       -append "pv-shim console=xen,pv -- console=hvc0 root=/dev/xvda1" \\
>>> +       -drive file=${GUEST_IMAGE},if=xen
>> Is the space between -- and console= intentionsl?
> Yes, that one is correct. The -- is how you separate Xen's command line
> (on the left) from the guest kernel command line (on the right).

To expand on this a bit.

Multiboot1 supports multiple modules but only a single command line.  As
one of the modules passed to Xen is the dom0 kernel, we need some way to
pass it's command line, hence the " -- ".

Multiboot2 and PVH support a command line per module, which is the
preferred way to pass the commandlines, given a choice.

~Andrew
--------------FpeNP3Ap5IjP2UdppoSTSNsb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 25/10/2023 7:26 pm, David Woodhouse
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:4a10a50e5469480a82cb993dedbff10c3d777082.camel@infradead.org">
      <pre class="moz-quote-pre" wrap="">On Wed, 2023-10-25 at 13:20 -0500, Eric Blake wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, Oct 25, 2023 at 03:50:42PM +0100, David Woodhouse wrote:<span
        style="white-space: pre-wrap">
</span></pre>
      </blockquote>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+Booting Xen PV guests
+---------------------
+
+Booting PV guest kernels is possible by using the Xen PV shim (a version of Xen
+itself, designed to run inside a Xen HVM guest and provide memory management
+services for one guest alone).
+
+The Xen binary is provided as the ``-kernel`` and the guest kernel itself (or
+PV Grub image) as the ``-initrd`` image, which actually just means the first
+multiboot "module". For example:
+
+.. parsed-literal::
+
+  |qemu_system| --accel kvm,xen-version=0x40011,kernel-irqchip=split \\
+       -chardev stdio,id=char0 -device xen-console,chardev=char0 \\
+       -display none  -m 1G  -kernel xen -initrd bzImage \\
+       -append "pv-shim console=xen,pv -- console=hvc0 root=/dev/xvda1" \\
+       -drive file=${GUEST_IMAGE},if=xen
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Is the space between -- and console= intentionsl?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, that one is correct. The -- is how you separate Xen's command line
(on the left) from the guest kernel command line (on the right).</pre>
    </blockquote>
    <br>
    To expand on this a bit.<br>
    <br>
    Multiboot1 supports multiple modules but only a single command
    line.  As one of the modules passed to Xen is the dom0 kernel, we
    need some way to pass it's command line, hence the " -- ".<br>
    <br>
    Multiboot2 and PVH support a command line per module, which is the
    preferred way to pass the commandlines, given a choice.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------FpeNP3Ap5IjP2UdppoSTSNsb--

