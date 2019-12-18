Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C811256B6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 23:30:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihhmV-0006ZL-Mr; Wed, 18 Dec 2019 22:26:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OBAf=2I=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ihhmT-0006ZG-W0
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 22:26:58 +0000
X-Inumbo-ID: 7f833796-21e5-11ea-911a-12813bfff9fa
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f833796-21e5-11ea-911a-12813bfff9fa;
 Wed, 18 Dec 2019 22:26:55 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C70E120814;
 Wed, 18 Dec 2019 17:26:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 18 Dec 2019 17:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7LMjwX
 OOcvCAcz6SUSdKE/X61AO1JA6wkP6Fo0KohQQ=; b=kcaIGa9QcwUaczUCBvCsK7
 e7lJuy2CSLcvstzX92veLADzrp1wtnyfcRpG0e63tqN67rm4Z0iTm0vQX6vaym9h
 CsJmBYHbXO1i8ZeaIGbEUkCQPG2xYJSvNBn6reDfrJyYX3En8jEDR0McglENbzd9
 xVPScosJozOvqcL2B5A2PzUf/Ja9t3nn0COeYqQhTDRy2nBtF2/dQPGIT7dfzzih
 RvSuecX9r1YqVw6ND47gHXwB1AditbS2dRvYU7SmpRzTYfC0KT91MEEmfhFx7XHo
 iqh8AXGTjYP/49WPhqnRyDL6DH08XhBsIuLfwMEcSW4/NDOUu2T8fAo8J5sYpIVA
 ==
X-ME-Sender: <xms:r6f6XVOd8RE5y4Hm6CPsgB_Grs4_8B-v5j1hN0JvSRgxzAnzGjDe5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtledgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:r6f6Xf5Es719Hp4jPvf3MdKOueJrq4p6NdbR82n6egb9IwdMTXcVTg>
 <xmx:r6f6XbedHsmTum-q3lMDUOCQusY1ydXX2hISSUEXs1eSutwZpCBCiQ>
 <xmx:r6f6XYLuUk-UOdmmdt-oD9mSGERD0pNVPCpGXxYE01LQeJw4yBn1jw>
 <xmx:r6f6XRPGMH_wPvK33Oqx35NcQr4gepWI-90KbRflw3ptMJ82uL_UJg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6CFCC306030B;
 Wed, 18 Dec 2019 17:26:54 -0500 (EST)
Date: Wed, 18 Dec 2019 23:26:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191218222652.GA4238@mail-itl>
References: <20191218150522.8697-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20191218150522.8697-1-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] tools/python: Python 3 compatibility
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============7031365485469143158=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7031365485469143158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH] tools/python: Python 3 compatibility

On Wed, Dec 18, 2019 at 03:05:22PM +0000, Andrew Cooper wrote:
> convert-legacy-stream is only used for incomming migration from pre Xen 4=
=2E7,
> and verify-stream-v2 appears to only be used by me during migration
> development - it is little surprise that they missed the main converstion
> effort in Xen 4.13.
>=20
> Fix it all up.
>=20
> Move open_file_or_fd() into a new util.py to avoid duplication, making it=
 a
> more generic wrapper around open() or fdopen().
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> This needs backporting to 4.13 ASAP
> ---
>  tools/python/scripts/convert-legacy-stream | 49 +++++++-----------------=
------
>  tools/python/scripts/verify-stream-v2      | 43 +++++-------------------=
--
>  tools/python/xen/migration/libxc.py        |  2 +-
>  tools/python/xen/migration/libxl.py        |  2 +-
>  tools/python/xen/migration/verify.py       |  4 +--
>  tools/python/xen/util.py                   | 23 ++++++++++++++
>  6 files changed, 46 insertions(+), 77 deletions(-)
>  create mode 100644 tools/python/xen/util.py
>=20
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/sc=
ripts/convert-legacy-stream
> index 5f80f13654..b0d81aa92e 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -5,6 +5,8 @@
>  Convert a legacy migration stream to a v2 stream.
>  """
> =20
> +from __future__ import print_function
> +
>  import sys
>  import os, os.path
>  import syslog
> @@ -12,6 +14,7 @@ import traceback
> =20
>  from struct import calcsize, unpack, pack
> =20
> +from xen.util import open_file_or_fd as open_file_or_fd
>  from xen.migration import legacy, public, libxc, libxl, xl
> =20
>  __version__ =3D 1
> @@ -39,16 +42,16 @@ def info(msg):
>              for line in msg.split("\n"):
>                  syslog.syslog(syslog.LOG_INFO, line)
>          else:
> -            print msg
> +            print(msg)
> =20
>  def err(msg):
>      """Error message, routed to appropriate destination"""
>      if log_to_syslog:
>          for line in msg.split("\n"):
>              syslog.syslog(syslog.LOG_ERR, line)
> -    print >> sys.stderr, msg
> +    print(msg, file =3D sys.stderr)
> =20
> -class StreamError(StandardError):
> +class StreamError(Exception):
>      """Error with the incoming migration stream"""
>      pass
> =20
> @@ -70,7 +73,7 @@ class VM(object):
> =20
>          # libxl
>          self.libxl =3D fmt =3D=3D "libxl"
> -        self.emu_xenstore =3D "" # NUL terminated key&val pairs from "to=
olstack" records
> +        self.emu_xenstore =3D b"" # NUL terminated key&val pairs from "t=
oolstack" records
> =20
>  def write_libxc_ihdr():
>      stream_write(pack(libxc.IHDR_FORMAT,

You also need to update write_record (string constants).
And few calls to it with string constants (write_libxl_end,
write_libxl_libxc_context, read_pv_tail, read_hvm_tail).
And blkid =3D=3D ... in read_pv_extended_info().

> @@ -336,7 +339,7 @@ def read_libxl_toolstack(vm, data):
>          if twidth =3D=3D 64:
>              name =3D name[:-4]
> =20
> -        if name[-1] !=3D '\x00':
> +        if name[-1] !=3D b'\x00':
>              raise StreamError("physmap name not NUL terminated")
> =20
>          root =3D "physmap/%x" % (phys,)
> @@ -347,7 +350,7 @@ def read_libxl_toolstack(vm, data):
>          for key, val in zip(kv[0::2], kv[1::2]):
>              info("    '%s' =3D '%s'" % (key, val))
> =20
> -        vm.emu_xenstore +=3D '\x00'.join(kv) + '\x00'
> +        vm.emu_xenstore +=3D b'\x00'.join(kv) + b'\x00'
> =20
> =20
>  def read_chunks(vm):
> @@ -534,7 +537,7 @@ def read_qemu(vm):
>      sig, =3D unpack("21s", rawsig)
>      info("Qemu signature: %s" % (sig, ))
> =20
> -    if sig =3D=3D "DeviceModelRecord0002":
> +    if sig =3D=3D b"DeviceModelRecord0002":
>          rawsz =3D rdexact(4)
>          sz, =3D unpack("I", rawsz)
>          qdata =3D rdexact(sz)
> @@ -617,36 +620,6 @@ def read_legacy_stream(vm):
>          return 2
>      return 0
> =20
> -def open_file_or_fd(val, mode):
> -    """
> -    If 'val' looks like a decimal integer, open it as an fd.  If not, tr=
y to
> -    open it as a regular file.
> -    """
> -
> -    fd =3D -1
> -    try:
> -        # Does it look like an integer?
> -        try:
> -            fd =3D int(val, 10)
> -        except ValueError:
> -            pass
> -
> -        # Try to open it...
> -        if fd !=3D -1:
> -            return os.fdopen(fd, mode, 0)
> -        else:
> -            return open(val, mode, 0)
> -
> -    except StandardError, e:
> -        if fd !=3D -1:
> -            err("Unable to open fd %d: %s: %s" %
> -                (fd, e.__class__.__name__, e))
> -        else:
> -            err("Unable to open file '%s': %s: %s" %
> -                (val, e.__class__.__name__, e))
> -
> -    raise SystemExit(1)
> -
> =20
>  def main():
>      from optparse import OptionParser
> @@ -723,7 +696,7 @@ def main():
>  if __name__ =3D=3D "__main__":
>      try:
>          sys.exit(main())
> -    except SystemExit, e:
> +    except SystemExit as e:
>          sys.exit(e.code)
>      except KeyboardInterrupt:
>          sys.exit(1)
> diff --git a/tools/python/scripts/verify-stream-v2 b/tools/python/scripts=
/verify-stream-v2
> index 3daf25791e..8355c2d206 100755
> --- a/tools/python/scripts/verify-stream-v2
> +++ b/tools/python/scripts/verify-stream-v2
> @@ -3,12 +3,15 @@
> =20
>  """ Verify a v2 format migration stream """
> =20
> +from __future__ import print_function
> +
>  import sys
>  import struct
>  import os, os.path
>  import syslog
>  import traceback
> =20
> +from xen.util import open_file_or_fd as open_file_or_fd
>  from xen.migration.verify import StreamError, RecordError
>  from xen.migration.libxc import VerifyLibxc
>  from xen.migration.libxl import VerifyLibxl
> @@ -25,7 +28,7 @@ def info(msg):
>              for line in msg.split("\n"):
>                  syslog.syslog(syslog.LOG_INFO, line)
>          else:
> -            print msg
> +            print(msg)
> =20
>  def err(msg):
>      """Error message, routed to appropriate destination"""
> @@ -33,7 +36,7 @@ def err(msg):
>          if log_to_syslog:
>              for line in msg.split("\n"):
>                  syslog.syslog(syslog.LOG_ERR, line)
> -        print >> sys.stderr, msg
> +        print(msg, file =3D sys.stderr)
> =20
>  def stream_read(_ =3D None):
>      """Read from input"""
> @@ -56,7 +59,7 @@ def skip_xl_header():
>      """Skip over an xl header in the stream"""
> =20
>      hdr =3D rdexact(32)
> -    if hdr !=3D "Xen saved domain, xl format\n \0 \r":
> +    if hdr !=3D b"Xen saved domain, xl format\n \0 \r":
>          raise StreamError("No xl header")
> =20
>      _, mflags, _, optlen =3D unpack_exact("=3DIIII")
> @@ -86,7 +89,7 @@ def read_stream(fmt):
>          err(traceback.format_exc())
>          return 1
> =20
> -    except StandardError:
> +    except Exception:
>          err("Script Error:")
>          err(traceback.format_exc())
>          err("Please fix me")
> @@ -94,36 +97,6 @@ def read_stream(fmt):
> =20
>      return 0
> =20
> -def open_file_or_fd(val, mode, buffering):
> -    """
> -    If 'val' looks like a decimal integer, open it as an fd.  If not, tr=
y to
> -    open it as a regular file.
> -    """
> -
> -    fd =3D -1
> -    try:
> -        # Does it look like an integer?
> -        try:
> -            fd =3D int(val, 10)
> -        except ValueError:
> -            pass
> -
> -        # Try to open it...
> -        if fd !=3D -1:
> -            return os.fdopen(fd, mode, buffering)
> -        else:
> -            return open(val, mode, buffering)
> -
> -    except StandardError, e:
> -        if fd !=3D -1:
> -            err("Unable to open fd %d: %s: %s" %
> -                (fd, e.__class__.__name__, e))
> -        else:
> -            err("Unable to open file '%s': %s: %s" %
> -                (val, e.__class__.__name__, e))
> -
> -    raise SystemExit(2)
> -
>  def main():
>      """ main """
>      from optparse import OptionParser
> @@ -168,7 +141,7 @@ def main():
>  if __name__ =3D=3D "__main__":
>      try:
>          sys.exit(main())
> -    except SystemExit, e:
> +    except SystemExit as e:
>          sys.exit(e.code)
>      except KeyboardInterrupt:
>          sys.exit(2)
> diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migra=
tion/libxc.py
> index f24448a9ef..cbffd1975e 100644
> --- a/tools/python/xen/migration/libxc.py
> +++ b/tools/python/xen/migration/libxc.py
> @@ -223,7 +223,7 @@ def verify_record(self):
>              self.squashed_pagedata_records +=3D 1
> =20
>          padding =3D content[length:]
> -        if padding !=3D "\x00" * len(padding):
> +        if padding !=3D b"\x00" * len(padding):
>              raise StreamError("Padding containing non0 bytes found")
> =20
>          if rtype not in record_verifiers:
> diff --git a/tools/python/xen/migration/libxl.py b/tools/python/xen/migra=
tion/libxl.py
> index d5f54dc489..79f4024e72 100644
> --- a/tools/python/xen/migration/libxl.py
> +++ b/tools/python/xen/migration/libxl.py
> @@ -128,7 +128,7 @@ def verify_record(self):
>          content =3D self.rdexact(contentsz)
> =20
>          padding =3D content[length:]
> -        if padding !=3D "\x00" * len(padding):
> +        if padding !=3D b"\x00" * len(padding):
>              raise StreamError("Padding containing non0 bytes found")
> =20
>          if rtype not in record_verifiers:
> diff --git a/tools/python/xen/migration/verify.py b/tools/python/xen/migr=
ation/verify.py
> index 7a42dbfc58..1e38f4a3c0 100644
> --- a/tools/python/xen/migration/verify.py
> +++ b/tools/python/xen/migration/verify.py
> @@ -7,11 +7,11 @@
> =20
>  from struct import calcsize, unpack
> =20
> -class StreamError(StandardError):
> +class StreamError(Exception):
>      """Error with the stream"""
>      pass
> =20
> -class RecordError(StandardError):
> +class RecordError(Exception):
>      """Error with a record in the stream"""
>      pass
> =20
> diff --git a/tools/python/xen/util.py b/tools/python/xen/util.py
> new file mode 100644
> index 0000000000..a11358eefa
> --- /dev/null
> +++ b/tools/python/xen/util.py
> @@ -0,0 +1,23 @@
> +#!/usr/bin/env python
> +# -*- coding: utf-8 -*-
> +
> +import os
> +
> +def open_file_or_fd(val, *argl, **kwargs):
> +    """
> +    If 'val' looks like a decimal integer, open it as an fd.  If not, tr=
y to
> +    open it as a regular file.
> +    """
> +
> +    fd =3D -1
> +    try:
> +        # Does it look like an integer?
> +        fd =3D int(val, 10)
> +    except ValueError:
> +        pass
> +
> +    # Try to open it...
> +    if fd !=3D -1:
> +        return os.fdopen(fd, *argl, **kwargs)
> +    else:
> +        return open(val, *argl, **kwargs)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl36p6wACgkQ24/THMrX
1yxlwwf8DHw2ZohLQ+MEQak+af0L/lmfQl9z+Pwh1vt8G921cnxmccRmK2kSue3P
nEKCcRVj/J36g+oHnOIsBpgOnvlCuRes94aV9CPBCyjrr/KeN8vrfXeqE7t2DjWJ
aantMubFpI/rxN5d5HXdY5iDazUHBz4qx0DFpP8GVXhO1OuZUsj10VcRugFhDGh3
ep5T6DnN1pVyIbESUYySNDhfsECWJ5b1Zn7YAmXbB9WZ9qK6q+9om7drn65FbH7u
TbUaj515PXkH8rQz0o7mWS644KUuneO6RgzTsMaEfqEu3lc9ElPhTeN4nvsA2xjr
ibfyrkXkvdjG0XlQ/Tk/rLaBW3Zbrg==
=sCAQ
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--


--===============7031365485469143158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7031365485469143158==--

