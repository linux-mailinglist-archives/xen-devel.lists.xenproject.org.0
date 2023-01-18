Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315C671DFB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480629.745144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8aL-00060F-N2; Wed, 18 Jan 2023 13:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480629.745144; Wed, 18 Jan 2023 13:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8aL-0005wR-JU; Wed, 18 Jan 2023 13:34:37 +0000
Received: by outflank-mailman (input) for mailman id 480629;
 Wed, 18 Jan 2023 13:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVew=5P=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pI8aK-0004x8-1d
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:34:36 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7f7c27f-9734-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:34:33 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id u19so83208956ejm.8
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jan 2023 05:34:33 -0800 (PST)
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
X-Inumbo-ID: d7f7c27f-9734-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k06LEAB5MHAytV5/Uwm4oB7cNWmj3eUN84cJ1XfmwJE=;
        b=lFleeUdKA/QelYXB7+zLFhrnhN7JOCUG+M+3oote2dcYkxVS1ojl68yLEdriWj0Amk
         5skJwNr9YU3L4It4chf5fDjIztZXgu0l0TplAalpnVb6CAtu+xjL/WLsJyggmLWvX/G4
         varTjXv7BGJ/caRA0VbaOjZrH1Kc3OJJ2Wq2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k06LEAB5MHAytV5/Uwm4oB7cNWmj3eUN84cJ1XfmwJE=;
        b=Ul4uX7TKb9p58al9TVprHk7f0QjZZNNEHI0cYntTKQaqaCQnqYtuQtcVHazjbTeXMO
         DtzjdvouwE/vG3x49KCa56dSJjC4tmWdKhQbnbkYN5gb4xFPlsKb9HM+dOyofq6osEDM
         DN1HmhAyJGkRqHgUpu2E9T54IzjsJaO9L7DQwZtclurYBDKYLqcIfxGvTvuXOX3y6A5P
         kP7tWw1B0nfTeZ7Zz20aF16Rh+odyRwkhnMmKzuXjKvQXafYYDPQyzf+QJsmALPfRSKX
         clsR/TwAnVhxTna4N8y8GLZ2qyxNc9TLadqaNbJ8QYt0odMLaBWf5wN0Bv9LxUwmEtL9
         TWVw==
X-Gm-Message-State: AFqh2kr8M+cw3WxxOh0N95o+YrOHiuVluWGhj8ZbgPxpHOUXxLXdohZ7
	PQiqHrZxTvRNTpX12rffTW3V1TV5lKi8YSLeJtRlOQ==
X-Google-Smtp-Source: AMrXdXsDlyYmgZzSHVK5gtp513jR06IghCa0lZLxTGFnhIvJQJCtB3kLLdeHnWMvwZTSd6WHqx3ETT3Sj6mRIF4aAAQ=
X-Received: by 2002:a17:906:dd5:b0:82b:61ad:c9ac with SMTP id
 p21-20020a1709060dd500b0082b61adc9acmr1008956eji.606.1674048873264; Wed, 18
 Jan 2023 05:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com> <926307d3-a354-be87-3885-90681dc5ae24@suse.com>
 <37719b71-8405-eefd-3bf5-95c7c8639e82@amd.com> <7e9db781-47a8-719a-d9b1-88de9c503732@suse.com>
In-Reply-To: <7e9db781-47a8-719a-d9b1-88de9c503732@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 18 Jan 2023 13:34:22 +0000
Message-ID: <CA+zSX=a4hfFKGJfTM5BDenRo=T3kvEbkGhRs=7oh4GgOxDk0+Q@mail.gmail.com>
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size
To: Jan Beulich <jbeulich@suse.com>
Cc: Ayan Kumar Halder <ayankuma@amd.com>, sstabellini@kernel.org, stefano.stabellini@amd.com, 
	Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>, 
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>, julien@xen.org, Wei Xu <xuwei5@hisilicon.com>
Content-Type: multipart/alternative; boundary="0000000000006d9bc905f289e058"

--0000000000006d9bc905f289e058
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 1:15 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 18.01.2023 12:15, Ayan Kumar Halder wrote:
> > On 18/01/2023 08:40, Jan Beulich wrote:
> >> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
> >>> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst
> uart_config[] =
> >>>   static int __init
> >>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int
> idx)
> >>>   {
> >>> -    u64 orig_base = uart->io_base;
> >>> +    paddr_t orig_base = uart->io_base;
> >>>       unsigned int b, d, f, nextf, i;
> >>>
> >>>       /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on
> bus 0. */
> >>> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t
> skip_amt, unsigned int idx)
> >>>                       else
> >>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
> >>>
> >>> -                    uart->io_base = ((u64)bar_64 << 32) |
> >>> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
> >>>                                       (bar &
> PCI_BASE_ADDRESS_MEM_MASK);
> >>>                   }
> >> This looks wrong to me: You shouldn't blindly truncate to 32 bits. You
> need
> >> to refuse acting on 64-bit BARs with the upper address bits non-zero.
> >
> > Yes, I was treating this like others (where Xen does not detect for
> > truncation while getting the address/size from device-tree and
> > typecasting it to paddr_t).
> >
> > However in this case, as Xen is reading from PCI registers, so it needs
> > to check for truncation.
> >
> > I think the following change should do good.
> >
> > @@ -1180,6 +1180,7 @@ pci_uart_config(struct ns16550 *uart, bool_t
> > skip_amt, unsigned int idx)
> >                   unsigned int bar_idx = 0, port_idx = idx;
> >                   uint32_t bar, bar_64 = 0, len, len_64;
> >                   u64 size = 0;
> > +                uint64_t io_base = 0;
> >                   const struct ns16550_config_param *param = uart_param;
> >
> >                   nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
> > @@ -1260,8 +1261,11 @@ pci_uart_config(struct ns16550 *uart, bool_t
> > skip_amt, unsigned int idx)
> >                       else
> >                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
> >
> > -                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
> > +                    io_base = ((u64)bar_64 << 32) |
> >                                       (bar & PCI_BASE_ADDRESS_MEM_MASK);
> > +
> > +                    uart->io_base = (paddr_t) io_base;
> > +                    ASSERT(uart->io_base == io_base); /* Detect
> > truncation */
> >                   }
> >                   /* IO based */
> >                   else if ( !param->mmio && (bar &
> > PCI_BASE_ADDRESS_SPACE_IO) )
>
> An assertion can only ever check assumption on behavior elsewhere in Xen.
> Anything external needs handling properly, including in non-debug builds.
>

Except in this case, it's detecting the result of the compiler cast just
above it, isn't it?  In which case it seems like it should be a
BUILD_BUG_ON() of some sort.

 -George

--0000000000006d9bc905f289e058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgSmFu
IDE4LCAyMDIzIGF0IDE6MTUgUE0gSmFuIEJldWxpY2ggJmx0OzxhIGhyZWY9Im1haWx0bzpqYmV1
bGljaEBzdXNlLmNvbSI+amJldWxpY2hAc3VzZS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPk9uIDE4LjAxLjIwMjMgMTI6MTUsIEF5YW4gS3VtYXIgSGFsZGVyIHdyb3RlOjxicj4N
CiZndDsgT24gMTgvMDEvMjAyMyAwODo0MCwgSmFuIEJldWxpY2ggd3JvdGU6PGJyPg0KJmd0OyZn
dDsgT24gMTcuMDEuMjAyMyAxODo0MywgQXlhbiBLdW1hciBIYWxkZXIgd3JvdGU6PGJyPg0KJmd0
OyZndDsmZ3Q7IEBAIC0xMTY2LDcgKzExNjYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5zMTY1
NTBfY29uZmlnIF9faW5pdGNvbnN0IHVhcnRfY29uZmlnW10gPTxicj4NCiZndDsmZ3Q7Jmd0O8Kg
IMKgc3RhdGljIGludCBfX2luaXQ8YnI+DQomZ3Q7Jmd0OyZndDvCoCDCoHBjaV91YXJ0X2NvbmZp
ZyhzdHJ1Y3QgbnMxNjU1MCAqdWFydCwgYm9vbF90IHNraXBfYW10LCB1bnNpZ25lZCBpbnQgaWR4
KTxicj4NCiZndDsmZ3Q7Jmd0O8KgIMKgezxicj4NCiZndDsmZ3Q7Jmd0OyAtwqAgwqAgdTY0IG9y
aWdfYmFzZSA9IHVhcnQtJmd0O2lvX2Jhc2U7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCBwYWRk
cl90IG9yaWdfYmFzZSA9IHVhcnQtJmd0O2lvX2Jhc2U7PGJyPg0KJmd0OyZndDsmZ3Q7wqAgwqAg
wqAgwqB1bnNpZ25lZCBpbnQgYiwgZCwgZiwgbmV4dGYsIGk7PGJyPg0KJmd0OyZndDsmZ3Q7wqAg
wqA8YnI+DQomZ3Q7Jmd0OyZndDvCoCDCoCDCoCDCoC8qIE5CLiBTdGFydCBhdCBidXMgMSB0byBh
dm9pZCBBTVQ6IGEgcGx1Zy1pbiBjYXJkIGNhbm5vdCBiZSBvbiBidXMgMC4gKi88YnI+DQomZ3Q7
Jmd0OyZndDsgQEAgLTEyNTksNyArMTI1OSw3IEBAIHBjaV91YXJ0X2NvbmZpZyhzdHJ1Y3QgbnMx
NjU1MCAqdWFydCwgYm9vbF90IHNraXBfYW10LCB1bnNpZ25lZCBpbnQgaWR4KTxicj4NCiZndDsm
Z3Q7Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWxzZTxicj4NCiZndDsm
Z3Q7Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2l6ZSA9IGxl
biAmYW1wOyBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOzxicj4NCiZndDsmZ3Q7Jmd0O8KgIMKg
PGJyPg0KJmd0OyZndDsmZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1YXJ0LSZn
dDtpb19iYXNlID0gKCh1NjQpYmFyXzY0ICZsdDsmbHQ7IDMyKSB8PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1YXJ0LSZndDtpb19iYXNlID0gKHBhZGRy
X3QpICgodTY0KWJhcl82NCAmbHQ7Jmx0OyAzMikgfDxicj4NCiZndDsmZ3Q7Jmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKGJhciAm
YW1wOyBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLKTs8YnI+DQomZ3Q7Jmd0OyZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQomZ3Q7Jmd0OyBUaGlzIGxvb2tzIHdyb25nIHRv
IG1lOiBZb3Ugc2hvdWxkbiYjMzk7dCBibGluZGx5IHRydW5jYXRlIHRvIDMyIGJpdHMuIFlvdSBu
ZWVkPGJyPg0KJmd0OyZndDsgdG8gcmVmdXNlIGFjdGluZyBvbiA2NC1iaXQgQkFScyB3aXRoIHRo
ZSB1cHBlciBhZGRyZXNzIGJpdHMgbm9uLXplcm8uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFllcywg
SSB3YXMgdHJlYXRpbmcgdGhpcyBsaWtlIG90aGVycyAod2hlcmUgWGVuIGRvZXMgbm90IGRldGVj
dCBmb3IgPGJyPg0KJmd0OyB0cnVuY2F0aW9uIHdoaWxlIGdldHRpbmcgdGhlIGFkZHJlc3Mvc2l6
ZSBmcm9tIGRldmljZS10cmVlIGFuZCA8YnI+DQomZ3Q7IHR5cGVjYXN0aW5nIGl0IHRvIHBhZGRy
X3QpLjxicj4NCiZndDsgPGJyPg0KJmd0OyBIb3dldmVyIGluIHRoaXMgY2FzZSwgYXMgWGVuIGlz
IHJlYWRpbmcgZnJvbSBQQ0kgcmVnaXN0ZXJzLCBzbyBpdCBuZWVkcyA8YnI+DQomZ3Q7IHRvIGNo
ZWNrIGZvciB0cnVuY2F0aW9uLjxicj4NCiZndDsgPGJyPg0KJmd0OyBJIHRoaW5rIHRoZSBmb2xs
b3dpbmcgY2hhbmdlIHNob3VsZCBkbyBnb29kLjxicj4NCiZndDsgPGJyPg0KJmd0OyBAQCAtMTE4
MCw2ICsxMTgwLDcgQEAgcGNpX3VhcnRfY29uZmlnKHN0cnVjdCBuczE2NTUwICp1YXJ0LCBib29s
X3QgPGJyPg0KJmd0OyBza2lwX2FtdCwgdW5zaWduZWQgaW50IGlkeCk8YnI+DQomZ3Q7wqAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGJhcl9pZHggPSAwLCBw
b3J0X2lkeCA9IGlkeDs8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdWludDMyX3QgYmFyLCBiYXJfNjQgPSAwLCBsZW4sIGxlbl82NDs8YnI+DQomZ3Q7wqAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTY0IHNpemUgPSAwOzxicj4NCiZndDsgK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBpb19iYXNlID0gMDs8YnI+DQom
Z3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IG5zMTY1
NTBfY29uZmlnX3BhcmFtICpwYXJhbSA9IHVhcnRfcGFyYW07PGJyPg0KJmd0OyA8YnI+DQomZ3Q7
wqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV4dGYgPSAoZiB8fCAocGNpX2Nv
bmZfcmVhZDE2KFBDSV9TQkRGKDAsIGIsIGQsIGYpLDxicj4NCiZndDsgQEAgLTEyNjAsOCArMTI2
MSwxMSBAQCBwY2lfdWFydF9jb25maWcoc3RydWN0IG5zMTY1NTAgKnVhcnQsIGJvb2xfdCA8YnI+
DQomZ3Q7IHNraXBfYW10LCB1bnNpZ25lZCBpbnQgaWR4KTxicj4NCiZndDvCoCDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2U8YnI+DQomZ3Q7wqAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemUgPSBsZW4gJmFtcDsg
UENJX0JBU0VfQUREUkVTU19NRU1fTUFTSzs8YnI+DQomZ3Q7IDxicj4NCiZndDsgLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVhcnQtJmd0O2lvX2Jhc2UgPSAocGFkZHJf
dCkgKCh1NjQpYmFyXzY0ICZsdDsmbHQ7IDMyKSB8PGJyPg0KJmd0OyArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW9fYmFzZSA9ICgodTY0KWJhcl82NCAmbHQ7Jmx0OyAz
MikgfDxicj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGJhciAmYW1wOyBQQ0lfQkFTRV9BRERS
RVNTX01FTV9NQVNLKTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1YXJ0LSZndDtpb19iYXNlID0gKHBhZGRyX3QpIGlvX2Jhc2U7
PGJyPg0KJmd0OyArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJU
KHVhcnQtJmd0O2lvX2Jhc2UgPT0gaW9fYmFzZSk7IC8qIERldGVjdCA8YnI+DQomZ3Q7IHRydW5j
YXRpb24gKi88YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTxi
cj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJTyBiYXNlZCAq
Lzxicj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmICgg
IXBhcmFtLSZndDttbWlvICZhbXA7JmFtcDsgKGJhciAmYW1wOyA8YnI+DQomZ3Q7IFBDSV9CQVNF
X0FERFJFU1NfU1BBQ0VfSU8pICk8YnI+DQo8YnI+DQpBbiBhc3NlcnRpb24gY2FuIG9ubHkgZXZl
ciBjaGVjayBhc3N1bXB0aW9uIG9uIGJlaGF2aW9yIGVsc2V3aGVyZSBpbiBYZW4uPGJyPg0KQW55
dGhpbmcgZXh0ZXJuYWwgbmVlZHMgaGFuZGxpbmcgcHJvcGVybHksIGluY2x1ZGluZyBpbiBub24t
ZGVidWcgYnVpbGRzLjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5FeGNlcHQg
aW4gdGhpcyBjYXNlLCBpdCYjMzk7cyBkZXRlY3RpbmcgdGhlIHJlc3VsdCBvZiB0aGUgY29tcGls
ZXIgY2FzdCBqdXN0IGFib3ZlIGl0LCBpc24mIzM5O3QgaXQ/wqAgSW4gd2hpY2ggY2FzZSBpdCBz
ZWVtcyBsaWtlIGl0IHNob3VsZCBiZSBhIEJVSUxEX0JVR19PTigpIG9mIHNvbWUgc29ydC48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKgLUdlb3JnZTwvZGl2PjwvZGl2PjwvZGl2Pg0K
--0000000000006d9bc905f289e058--

