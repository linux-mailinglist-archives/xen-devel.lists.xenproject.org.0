Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3D1277AC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 09:58:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiE31-0006zb-SP; Fri, 20 Dec 2019 08:54:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FK0b=2K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iiE30-0006zW-A2
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 08:54:10 +0000
X-Inumbo-ID: 4433b022-2306-11ea-a1e1-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4433b022-2306-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 08:54:00 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CFA69224F1;
 Fri, 20 Dec 2019 03:54:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 20 Dec 2019 03:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QFVZlN
 YDgIH8+nNlbWt2N7MIkldxApP280LhFd/KvFo=; b=jPa6YT3fBjaXf10pI9qP0F
 w71gN/rbKX4W50Woi5/+H5Oxt0UkhsuMF65YyhRUWnEG8z65CBuYRPYz5RikYkm5
 EZ5xgKlEf9ailloiEFxC0sjOjO1L6d2VCoIk/qgvfPekI0hLljcPyaclJGzN81ze
 b8tzZv0F8yxOtDSnPGEAB7EXOZdYiAMh4r0brqinKczhUuZxCtIzmZsv5DGDqMK0
 UCASduAunIUQK/9rv8DLEvv+/6/uRK32/knZz/IlSVFpa3cJS/uxxo6yKC0vwn4G
 duEm4EV6Iim2UgdYqbZ9ek4GDE1dBSIPlBIBn2yyrUOG6zUV6aWe/B0+ShVU6p1A
 ==
X-ME-Sender: <xms:KIz8XSif17ZXTBvqWp86Cqj-uj7sAVsVZSxGcS1VFKsdymMNRRz0LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduvddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeefjedrfedtrdehhedr
 geehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:KIz8XWBqS3bmh7YuAmwK6VpEb_Bfc3yixzSYrTo66ZNHnIlj9Boudw>
 <xmx:KIz8XVuNMkwcc9Cm2OcpPGjQb-TBGco5kcv0qpxLyqcEokYvzXX3Iw>
 <xmx:KIz8XZ98MVkYf48T4XU8yjPX-X4RmzYfRwc3JMmzLCrISRCSWSVvzQ>
 <xmx:KIz8Xew9aGKMlJ_KEgeKRSGYQ_95FwG3cMqULRNcxlIDViSCjl7k0w>
Received: from mail-itl (37.30.55.45.nat.umts.dynamic.t-mobile.pl
 [37.30.55.45])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D39880065;
 Fri, 20 Dec 2019 03:53:58 -0500 (EST)
Date: Fri, 20 Dec 2019 09:53:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191220085353.GE25022@mail-itl>
References: <20191219130412.8258-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20191219130412.8258-1-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] tools/python: Python 3 compatibility
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
Content-Type: multipart/mixed; boundary="===============4849790108760767985=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4849790108760767985==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L2Brqb15TUChFOBK"
Content-Disposition: inline


--L2Brqb15TUChFOBK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] tools/python: Python 3 compatibility

On Thu, Dec 19, 2019 at 01:04:12PM +0000, Andrew Cooper wrote:
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
> In libxc.py, drop all long() conversion.  Python 2 will DTRT with int =3D=
> long
> promotion, even on 32bit builds.
>=20
> In convert-legacy-stream, don't pass empty strings to write_record().  Jo=
in on
> the empty argl will do the right thing.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> v2:
>  * Drop int/long in libxc.py.  Python 2 will DTRT with int turning into l=
ong.
>  * More b prefixes in convert-legacy-stream.  Drop empty string passing
>=20
> This needs backporting to 4.13 ASAP
> ---
>  tools/python/scripts/convert-legacy-stream | 67 +++++++++---------------=
------
>  tools/python/scripts/verify-stream-v2      | 42 ++++---------------
>  tools/python/xen/__init__.py               |  1 -
>  tools/python/xen/lowlevel/__init__.py      |  1 -
>  tools/python/xen/migration/libxc.py        | 34 +++++++--------
>  tools/python/xen/migration/libxl.py        |  2 +-
>  tools/python/xen/migration/verify.py       |  4 +-
>  tools/python/xen/util.py                   | 23 ++++++++++
>  8 files changed, 69 insertions(+), 105 deletions(-)
>  create mode 100644 tools/python/xen/util.py
>=20
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/sc=
ripts/convert-legacy-stream
> index 5f80f13654..d316ae16f0 100755
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
> @@ -102,12 +105,12 @@ def write_libxl_hdr():
>                        ))
> =20
>  def write_record(rt, *argl):
> -    alldata =3D ''.join(argl)
> +    alldata =3D b''.join(argl)
>      length =3D len(alldata)
> =20
>      record =3D pack(libxc.RH_FORMAT, rt, length) + alldata
>      plen =3D (8 - (length & 7)) & 7
> -    record +=3D '\x00' * plen
> +    record +=3D b'\x00' * plen
> =20
>      stream_write(record)
> =20
> @@ -164,10 +167,10 @@ def write_libxc_hvm_params(params):
>                   pack("Q" * len(params), *params))
> =20
>  def write_libxl_end():
> -    write_record(libxl.REC_TYPE_end, "")
> +    write_record(libxl.REC_TYPE_end)
> =20
>  def write_libxl_libxc_context():
> -    write_record(libxl.REC_TYPE_libxc_context, "")
> +    write_record(libxl.REC_TYPE_libxc_context)
> =20
>  def write_libxl_emulator_xenstore_data(data):
>      write_record(libxl.REC_TYPE_emulator_xenstore_data,
> @@ -225,7 +228,7 @@ def read_pv_extended_info(vm):
>          so_far +=3D datasz
> =20
>          # Eww, but this is how it is done :(
> -        if blkid =3D=3D "vcpu":
> +        if blkid =3D=3D b"vcpu":
> =20
>              vm.basic_len =3D datasz
> =20
> @@ -242,10 +245,10 @@ def read_pv_extended_info(vm):
> =20
>              write_libxc_pv_info(vm)
> =20
> -        elif blkid =3D=3D "extv":
> +        elif blkid =3D=3D b"extv":
>              vm.extd =3D True
> =20
> -        elif blkid =3D=3D "xcnt":
> +        elif blkid =3D=3D b"xcnt":
>              vm.xsave_len, =3D unpack("I", data[:4])
>              info("xcnt sz 0x%x" % (vm.xsave_len, ))
> =20
> @@ -296,7 +299,7 @@ def read_pv_tail(vm):
>      info("Got shinfo")
> =20
>      write_record(libxc.REC_TYPE_shared_info, shinfo)
> -    write_record(libxc.REC_TYPE_end, "")
> +    write_record(libxc.REC_TYPE_end)
> =20
> =20
>  def read_libxl_toolstack(vm, data):
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
> @@ -524,7 +527,7 @@ def read_hvm_tail(vm):
>      blob =3D rdexact(blobsz)
> =20
>      write_record(libxc.REC_TYPE_hvm_context, blob)
> -    write_record(libxc.REC_TYPE_end, "")
> +    write_record(libxc.REC_TYPE_end)
> =20
> =20
> =20
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
> index 3daf25791e..8bac04d566 100755
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
> @@ -94,35 +97,6 @@ def read_stream(fmt):
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
> =20
>  def main():
>      """ main """
> @@ -168,7 +142,7 @@ def main():
>  if __name__ =3D=3D "__main__":
>      try:
>          sys.exit(main())
> -    except SystemExit, e:
> +    except SystemExit as e:
>          sys.exit(e.code)
>      except KeyboardInterrupt:
>          sys.exit(2)
> diff --git a/tools/python/xen/__init__.py b/tools/python/xen/__init__.py
> index 8d1c8b69c3..e69de29bb2 100644
> --- a/tools/python/xen/__init__.py
> +++ b/tools/python/xen/__init__.py
> @@ -1 +0,0 @@
> -=20
> diff --git a/tools/python/xen/lowlevel/__init__.py b/tools/python/xen/low=
level/__init__.py
> index 8d1c8b69c3..e69de29bb2 100644
> --- a/tools/python/xen/lowlevel/__init__.py
> +++ b/tools/python/xen/lowlevel/__init__.py
> @@ -1 +0,0 @@
> -=20
> diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migra=
tion/libxc.py
> index f24448a9ef..0a329c2090 100644
> --- a/tools/python/xen/migration/libxc.py
> +++ b/tools/python/xen/migration/libxc.py
> @@ -14,10 +14,6 @@
> =20
>  from xen.migration.verify import StreamError, RecordError, VerifyBase
> =20
> -# In Python3 long type have been merged into int, 1L syntax is no longer=
 valid
> -if sys.version_info > (3,):
> -    long =3D int
> -
>  # Image Header
>  IHDR_FORMAT =3D "!QIIHHI"
> =20
> @@ -87,23 +83,23 @@
> =20
>  # page_data
>  PAGE_DATA_FORMAT             =3D "II"
> -PAGE_DATA_PFN_MASK           =3D (long(1) << 52) - 1
> -PAGE_DATA_PFN_RESZ_MASK      =3D ((long(1) << 60) - 1) & ~((long(1) << 5=
2) - 1)
> +PAGE_DATA_PFN_MASK           =3D (1 << 52) - 1
> +PAGE_DATA_PFN_RESZ_MASK      =3D ((1 << 60) - 1) & ~((1 << 52) - 1)
> =20
>  # flags from xen/public/domctl.h: XEN_DOMCTL_PFINFO_* shifted by 32 bits
>  PAGE_DATA_TYPE_SHIFT         =3D 60
> -PAGE_DATA_TYPE_LTABTYPE_MASK =3D (long(0x7) << PAGE_DATA_TYPE_SHIFT)
> -PAGE_DATA_TYPE_LTAB_MASK     =3D (long(0xf) << PAGE_DATA_TYPE_SHIFT)
> -PAGE_DATA_TYPE_LPINTAB       =3D (long(0x8) << PAGE_DATA_TYPE_SHIFT) # P=
inned pagetable
> -
> -PAGE_DATA_TYPE_NOTAB         =3D (long(0x0) << PAGE_DATA_TYPE_SHIFT) # R=
egular page
> -PAGE_DATA_TYPE_L1TAB         =3D (long(0x1) << PAGE_DATA_TYPE_SHIFT) # L=
1 pagetable
> -PAGE_DATA_TYPE_L2TAB         =3D (long(0x2) << PAGE_DATA_TYPE_SHIFT) # L=
2 pagetable
> -PAGE_DATA_TYPE_L3TAB         =3D (long(0x3) << PAGE_DATA_TYPE_SHIFT) # L=
3 pagetable
> -PAGE_DATA_TYPE_L4TAB         =3D (long(0x4) << PAGE_DATA_TYPE_SHIFT) # L=
4 pagetable
> -PAGE_DATA_TYPE_BROKEN        =3D (long(0xd) << PAGE_DATA_TYPE_SHIFT) # B=
roken
> -PAGE_DATA_TYPE_XALLOC        =3D (long(0xe) << PAGE_DATA_TYPE_SHIFT) # A=
llocate-only
> -PAGE_DATA_TYPE_XTAB          =3D (long(0xf) << PAGE_DATA_TYPE_SHIFT) # I=
nvalid
> +PAGE_DATA_TYPE_LTABTYPE_MASK =3D (0x7 << PAGE_DATA_TYPE_SHIFT)
> +PAGE_DATA_TYPE_LTAB_MASK     =3D (0xf << PAGE_DATA_TYPE_SHIFT)
> +PAGE_DATA_TYPE_LPINTAB       =3D (0x8 << PAGE_DATA_TYPE_SHIFT) # Pinned =
pagetable
> +
> +PAGE_DATA_TYPE_NOTAB         =3D (0x0 << PAGE_DATA_TYPE_SHIFT) # Regular=
 page
> +PAGE_DATA_TYPE_L1TAB         =3D (0x1 << PAGE_DATA_TYPE_SHIFT) # L1 page=
table
> +PAGE_DATA_TYPE_L2TAB         =3D (0x2 << PAGE_DATA_TYPE_SHIFT) # L2 page=
table
> +PAGE_DATA_TYPE_L3TAB         =3D (0x3 << PAGE_DATA_TYPE_SHIFT) # L3 page=
table
> +PAGE_DATA_TYPE_L4TAB         =3D (0x4 << PAGE_DATA_TYPE_SHIFT) # L4 page=
table
> +PAGE_DATA_TYPE_BROKEN        =3D (0xd << PAGE_DATA_TYPE_SHIFT) # Broken
> +PAGE_DATA_TYPE_XALLOC        =3D (0xe << PAGE_DATA_TYPE_SHIFT) # Allocat=
e-only
> +PAGE_DATA_TYPE_XTAB          =3D (0xf << PAGE_DATA_TYPE_SHIFT) # Invalid
> =20
>  # x86_pv_info
>  X86_PV_INFO_FORMAT        =3D "BBHI"
> @@ -223,7 +219,7 @@ def verify_record(self):
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

--L2Brqb15TUChFOBK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl38jCEACgkQ24/THMrX
1yxMkgf/U97GzehdUTL1ZPJZBYXhy/uwj6P3R0tiq2/8srtj0wKOFbPk9IXhlTsw
QSp4+N4IqQ61K9qOmd2z2d6VROUTsO59LbkRn1uusf0ufvNGaN6KM4SsZKgI7vwg
edF7GC/rFJSGCW3uy5a5oQUYecPT5E72IgD+G/rD30z+MDd3So486dN0iQxAdqgG
P3hobdfUvlgeVng9qRlrwioYos9bIX0Z2JW0yC/H+JcCkVo7K1oJyZGxah/zvqiK
D/c4hOW4IT2B2HENchmE57SdkRqUw27VxSGN63KTd25WcTMiZiAe7KnIVcvz+Nan
CsBVU48iZiZidlgbJFgO+bJG1pvgvg==
=Xpq8
-----END PGP SIGNATURE-----

--L2Brqb15TUChFOBK--


--===============4849790108760767985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4849790108760767985==--

