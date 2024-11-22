Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2E9D657C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 22:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842044.1257496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEbcQ-0006vk-Ot; Fri, 22 Nov 2024 21:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842044.1257496; Fri, 22 Nov 2024 21:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEbcQ-0006th-Ln; Fri, 22 Nov 2024 21:55:14 +0000
Received: by outflank-mailman (input) for mailman id 842044;
 Fri, 22 Nov 2024 21:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMXp=SR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tEbcP-0006tb-0u
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 21:55:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ffd0bca-a91c-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 22:55:07 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso23200155e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 13:55:07 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde070easm40270455e9.5.2024.11.22.13.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 13:55:05 -0800 (PST)
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
X-Inumbo-ID: 6ffd0bca-a91c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZmZmQwYmNhLWE5MWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMzEyNTA3LjczODM2Mywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732312507; x=1732917307; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO0BjKQdgLpzBtDQuFZ5cTsAXwezue3qAJZ4xqI4D6Q=;
        b=hGxuc3JLclbSB8JE7zi2VTWlQDaK/6Z/N7Ddovx9PdaPwuxPyUZZ/1EW7xjjUIaq0G
         fUnisut+UOrwX8/oI2zMS7osdoBuEFHxM9bHWL/8WjLkTFgNgE7uuhSbqUnuviubeXgf
         uX0lisBq+ajqtyspOPOfjcfHKteMP835OJfnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732312507; x=1732917307;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eO0BjKQdgLpzBtDQuFZ5cTsAXwezue3qAJZ4xqI4D6Q=;
        b=XzE2S/sUToLlRP5AIH9u5Nm6PL6nLGg3OED0804QVUjZa5uuC49P+04IcYGbgF4JFT
         L0lg2cApOxK7CirA+bSnNH1M6fO72gSj98zTh7iwCmYGfAMZKHBenYjXiL8o7MXR8cxR
         Zl6LVch+AYhwFRVl71TmzK6yP8BIOL2GmtdZvRfYZUChBrAXfUKr6omNuZ0EJqbjdkIg
         qMk8zNMvrfCTz2AdVfwbHgzsbOE9+2zXg+LdQn9ezJhHSygCjzOYn9bVh3YGI8vLS2mx
         6qQM/y5/DFBvObjxO/3gefByC6p+PdfXWBg7ffKIgwJA5lf62w1snp90GGBF8qydgNO1
         qxrw==
X-Forwarded-Encrypted: i=1; AJvYcCVidzyBRaRRa0Ju1BqdgL/LQZtJJDOKdnNxyxQD/jsl/pfN7cYfMW6xGVXM+/yH2rSJ1hj+oHlg6Q8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzB+HhMxwSBTve5S/LOvKZ6h+qLIjL12NzoCc3D6BO1O/YiSm4T
	YYitZRdIAmJtFnpOy+eOo2k6OnsMG2J9CUFQXzqztJONfOwAEoRL/saOCWU2rAqqrlyYlx+WRzR
	a
X-Gm-Gg: ASbGncvHx6t7+yYnuQlaacJ3iLO87f8K20qfbfGKJXOIOVMnme8sGi+HJtEHcNsHC9a
	eCgk6rC2lTyanvCVPZXEEF4Hk/B4WSviVF4nxE+ZN6c9jVB/5qC17h37B435aonRWlkzozp3V65
	tkJMIQ3rzdeWrl0SDF84P7z6gvR2ZfOefePHiD2OcmYuRojb9yoVGHy3KikWGNHENpo/AloBFyk
	SVR9LjTwbQv5fAKi+eXdVk8OW5Q9SF4250lk7n+4dJPW6BmW7ZqCxOiQte5Sx18KQpvb2edkZHH
	L1i5
X-Google-Smtp-Source: AGHT+IG5U/ecmZiuczBPP8iu+abpreSr6cfUbtYm8UVGjX5CtHoxhoTSIp33Ar9PzlHBFHofqW1XjA==
X-Received: by 2002:a05:600c:45c7:b0:431:518a:683b with SMTP id 5b1f17b1804b1-434891a1e57mr26338495e9.18.1732312506841;
        Fri, 22 Nov 2024 13:55:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Nov 2024 21:55:04 +0000
Message-Id: <D5T1J6D9918L.1TO68X0HW9QMS@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Anthony PERARD" <anthony.perard@vates.tech>
Subject: Re: [RFC XEN PATCH] docs/designs: Add a design document for 'xen'
 Rust crate
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <c0f88345e1ee870dc10a209e3840ae98b2ac1386.1732283549.git.teddy.astie@vates.tech>
In-Reply-To: <c0f88345e1ee870dc10a209e3840ae98b2ac1386.1732283549.git.teddy.astie@vates.tech>

Hi,

I've given some feedback on the primitives for buffers and some questions o=
n
the choice of aggressive use of traits.

On Fri Nov 22, 2024 at 2:01 PM GMT, Teddy Astie wrote:
> Add a design document for the 'xen' rust crate.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Follows Alejandro works with https://lore.kernel.org/xen-devel/D5SQEZIL2S=
ZV.QR3X5MRVQJJP@cloud.com/T/#t
> There is also a WIP branch at https://gitlab.com/TSnake41/xen/-/tree/rust=
-rfc
> ---
>  docs/designs/xen-rust-crate.md | 199 +++++++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 docs/designs/xen-rust-crate.md
>
> diff --git a/docs/designs/xen-rust-crate.md b/docs/designs/xen-rust-crate=
.md
> new file mode 100644
> index 0000000000..5eab603d4d
> --- /dev/null
> +++ b/docs/designs/xen-rust-crate.md
> @@ -0,0 +1,199 @@
> +# Rust 'xen' crate interface design
> +
> +See [1] for more context.
> +
> +This RFC proposes parts of the 'xen' crate interface that would directly=
 or indirectly
> +(through internal wrappers) be used by users.
> +Those users could be a userland toolstack, a unikernel application (e.g =
XTF, Unikraft),
> +some other freestanding environment (e.g OVMF, Linux, Redox OS), ...
> +
> +These users can have a very different execution environment, this crate =
aims to provide
> +a uniform interface while allowing flexibility for exposing platform-spe=
cific bits.
> +
> +## Design philosophy
> +
> +This crate should feel natural for a Rust developper, thus, any Rust dev=
elopper with some
> +understanding on the Xen hypercall operations should be able to use this=
 crate.
> +Moreover, we want this crate to be maintainable and feel "idiomatic", an=
d not introduce
> +confusing behavior onto the user. Note that this crate will heavily use =
unsafe code.
> +
> +Some principles are proposed :
> +
> +Use or provide idiomatic abstractions when relevant (reuse standard trai=
ts).
> +
> +Examples:
> +  Provide (optional) Future<...> abstractions for event channels
> +  Provide a iterator-based (Stream ? [2]) abstraction for guest console.
> +
> +Don't restrict features to some execution environment, use modular abstr=
actions (e.g traits)
> +to allow the user to specify the missing bits himself / provide its own =
implementation.
> +Note that it doesn't prevent us from exposing the platform-specific bits=
 onto the
> +types themselves (e.g UnixXenEventChannel can still expose its file desc=
riptor).

Traits are superhelpful for dynamic dispatch and building type constraints.
Sometimes for enforcing interfaces if they are not all built at the same ti=
me.

What exactly are the benefits of subjecting all interfaces to traits? What =
do
they enable that cannot otherwise be done by extending the interface export=
ed
by some struct (say, an opaque filedesc wrapper)?

> +
> +Example:
> +  If we provide a event channel abstraction based on the hypercall but i=
t doesn't implement Future<...>,
> +  the user can still implement its own type on top of the hypercall impl=
ementation, and
> +  use its own async runtime (e.g based on interrupts) to implement Futur=
e<...> himself.
> +  There could be 2 traits for varying needs :
> +    EventChannel (base trait) and AsyncEventChannel (await-able EventCha=
nnel)
> +
> +  We can have both RawEventChannel based on XenHypercall that only imple=
ments EventChannel
> +  and another type TokioEventChannel that provides both EventChannel and=
 AsyncEventChannel
> +  and integrates with tokio runtime.

Not sure why traits would be essential here either. It's hard to assess wit=
hout
looking at a particular case where using traits effectively simplifies the
problem.

> +
> +Safe wrappers must be "sound" and unsafe code shall not cause undefined =
behavior.
> +- safe wrappers must not cause undefined behavior on their own
> +- unsafe code should not cause undefined behavior if properly used

I agree. The external interface must be soundly safe as far as reasonably
possible. And unsafe code must be adequately annotated with the cares that =
the
caller must have.

> +
> +This is a bit tricky due to some Xen specificities, but we expect hyperc=
all to be well
> +formed (we can add validation tools for that) including have its paramet=
er indirectly
> +respect the aliasing rules [3].

> +Although, we assume that Xen is well-behaving regarding its ABI.
> +We don't define misuse of a hypercall that can harm the guest himself, b=
ut we care
> +about not causing a undefined behavior (e.g by passing a buggy pointer) =
through the
> +hypercall interface that can overwrite unrelated/arbitrary kernel memory=
.
> +
> +## Hypercall interface
> +
> +We introduce a XenHypercall trait that exposes a raw primitive for makin=
g hypercalls.
> +This interface supposes nothing on the ABI used in Xen, and its the resp=
onsibility
> +of the user of such interface (often safe wrappers) that the hypercall m=
ade is
> +meaningful.
> +
> +This interface is mostly to only be used by the crate developpers to bui=
ld safe
> +wrappers on top, or by advanced user for using non-exposed/WIP hypercall=
 interfaces
> +or bypassing the safe wrappers.
> +
> +We can implement this interface for freestanding platforms using direct =
native hypercalls
> +(e.g using inline assembly) for freestanding platforms or in userland us=
ing special devices
> +like privcmd/xencall on most Unix platforms.
> +
> +```rust
> +pub trait XenHypercall: Sized {
> +    unsafe fn hypercall5(&self, cmd: usize, param: [usize; 5]) -> usize;
> +
> +    unsafe fn hypercall4(&self, cmd: usize, param: [usize; 4]) -> usize;
> +    unsafe fn hypercall3(&self, cmd: usize, param: [usize; 3]) -> usize;
> +    unsafe fn hypercall2(&self, cmd: usize, param: [usize; 2]) -> usize;
> +    unsafe fn hypercall1(&self, cmd: usize, param: usize) -> usize;
> +    unsafe fn hypercall0(&self, cmd: usize) -> usize;
> +
> +    /* ... */
> +}
> +```
> +
> +### Hypercall-safe buffers
> +
> +One difficulty is that in a freestanding environment, we need to use poi=
nters to
> +original data. But in a hosted environment, we need to make special buff=
ers instead
> +for that.
> +
> +We introduce the Xen{Const/Mut}Buffer generic trait that wraps a referen=
ce in a
> +"hypercall-safe" buffer that may or may not be a bounce buffer.
> +
> +```rust
> +/// Wrapper of a reference into a hypercall-safe buffer.
> +pub trait XenConstBuffer<T> {
> +    /// Get a hypercall-safe reference to underlying data.
> +    fn as_hypercall_ptr(&self) -> *const T;
> +}
> +
> +/// Wrapper of a mutable reference into a mutable hypercall-safe buffer.
> +pub trait XenMutBuffer<T> {
> +    /// Get a hypercall-safe mutable reference to underlying data.
> +    fn as_hypercall_ptr(&mut self) -> *mut T;
> +
> +    /// Update original reference with new data.
> +    unsafe fn update(&mut self);
> +}

Rather than trying to wrap the borrows I think it makes more sense to wrap
ownership. If we provide a xen::Box<T> type (not necessarily tied to a stan=
dard
allocator) that wraps ownership of its content then we can use the same typ=
e
for const and mut references (because it's just &T and &mut T after Deref a=
nd
DerefMut are implemented). Getting the pointers for hypercalls can be done =
via
the references. Like so:

  puf foo(p: *mut u8) {
      // something
  }

  puf main() {
      let mut var =3D 8;
      foo(&mut var);
  }

This is tip-toeing on UB by getting a *mut from a &mut, but
because the &mut is coerced into a *mut on function call this is both safe =
and
sound. Miri is happy with it too because it obeys stacked borrows.

That's for inputs. Pointer outputs are profoundly unsafe and I'm really hop=
ing
there's nothing that requires it. Fingers crossed...

> +
> +// The user will make those wrappers using dedicated functions in XenHyp=
ercall trait.
> +
> +trait XenHypercall: Sized {
> +    /* ... */
> +    type Error;
> +
> +    fn make_const_object<T: Copy + ?Sized>(
> +        &self,
> +        buffer: &T,
> +    ) -> Result<impl XenConstBuffer<T>, Self::Error>;
> +
> +    fn make_mut_buffer<T: Copy + ?Sized>(
> +        &self,
> +        buffer: &mut T,
> +    ) -> Result<impl XenMutBuffer<T>, Self::Error>;
> +
> +    fn make_const_slice<T: Copy + Sized>(
> +        &self,
> +        slice: &[T],
> +    ) -> Result<impl XenConstBuffer<T>, Self::Error>;
> +
> +    fn make_mut_slice<T: Copy + Sized>(
> +        &self,
> +        slice: &mut [T],
> +    ) -> Result<impl XenMutBuffer<T>, Self::Error>;
> +}
> +```

This is what I meant at the beginning. What's the advantage of having
XenConstBuffer (et al.) being a trait rather than a struct? You can access =
it's
interior via Deref and DerefMut (like Box<T> and Mutex<T> do) already, so t=
hey
can implement the same interface as T.

> +
> +Example use:
> +
> +```rust
> +fn demo_hypercall<H: XenHypercall>(interface: &H, buffer: &mut [u8]) -> =
Result<(), H::Error> {
> +    let buffer_size =3D buffer.len();
> +    // make a hypercall-safe wrapper of `buffer`
> +    let hyp_buffer =3D interface.make_mut_slice(buffer)?;
> +
> +    let op =3D SomeHypercallStruct {
> +        buffer: hyp_buffer.as_hypercall_ptr(),
> +        buffer_size: buffer_size as _,
> +    };
> +    // Do the same for hyp_op
> +    let hyp_op =3D interface.make_const_object(&op)?;
> +
> +    unsafe {
> +        interface.hypercall1(SOME_CMD, hyp_op.as_hypercall_ptr().addr())=
;
> +        // assume success
> +        hyp_buffer.update(); // update buffer back
> +    }
> +
> +    Ok(())
> +}
> +```

One of the bits I liked about the original libxen I showed at Xen Summit we=
re
the `IsSysCtl` and `IsDomctl` traits. We can generate them from xenbindgen
itself and use them as constraints so you don't try to use an invalid type =
for
a hypercall. It'll need tweaking, I guess. But the interface cannot be safe
until you can't mess up the arguments.

evtchn and gntops work differently, but the same idea ought to work.

> +need to use special functions for that (`core::ptr::slice_from_raw_parts=
` ?).
> +But for that, we need to know that T is actually a slice before using th=
is function.
> +
> +## Event channels
> +
> +TODO
> +
> +[1] - Interfacing Rust with Xen - Alejandro Vallejo, XenServer BU, Cloud=
 Software Group
> +https://youtu.be/iFh4n2kbAwM
> +
> +[2] - The Stream Trait
> +https://rust-lang.github.io/async-book/05_streams/01_chapter.html
> +
> +[3] - Aliasing
> +https://doc.rust-lang.org/nomicon/aliasing.html
> +
> +[4] - https://blog.rust-lang.org/2023/12/21/async-fn-rpit-in-traits.html
> +https://rust-lang.github.io/rfcs/3498-lifetime-capture-rules-2024.html

I think it'll be a while under we settle on a design.

My latest advances with xenbindgen involve formalizing evtchn, and that sho=
uld
be a fantastic playing ground for experimenting. I suspect we'll struggle t=
o
see the big picture until the foundational stuff is in place and we try to
expose real hypercalls.

Cheers,
Alejandro

