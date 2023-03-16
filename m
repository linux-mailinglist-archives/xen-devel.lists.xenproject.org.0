Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2B6BD7AD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 19:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510773.789115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrtn-00033t-7f; Thu, 16 Mar 2023 18:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510773.789115; Thu, 16 Mar 2023 18:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrtn-00031Y-3w; Thu, 16 Mar 2023 18:00:23 +0000
Received: by outflank-mailman (input) for mailman id 510773;
 Thu, 16 Mar 2023 18:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcrtl-00031S-Qb
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 18:00:21 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 686314ef-c424-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 19:00:18 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 338A73200936;
 Thu, 16 Mar 2023 14:00:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 16 Mar 2023 14:00:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 14:00:13 -0400 (EDT)
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
X-Inumbo-ID: 686314ef-c424-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678989614; x=1679076014; bh=WMc0jHu+DCh3CThRnkrTuAJWS4NevNVaR/n
	vCreUHeA=; b=sNI5IDF/Sq+Rw8p7w6C5vr4B6gVmO+VYNQ6Gm65EIysSFvuj4oZ
	aDaBXz4HUJDFiaYUhTYwKb8n0Sj/u1mLAXW8uU8awzs8FEpJZ+Co5XYypm0t3jQx
	9PSjGLMDCsbqOsD1mwNvByZV4fJBHNq14WslhyzH4QB1P8xEFMlP66yjeplXHnwi
	2eJx5ZkWxil3de0sqmve7ETpZOWeS1+E7hpX0Z7hbnMDsbHrizISBripD7VO5yJc
	VGhbGd1N0D13gouTipPp4dCerIfag85D64mxvxYT/IQX8fo/kn1mNL18FsvIZ07m
	lh4k6/Mr9BR+/89mYjj1K771xA6dSFX+6dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678989614; x=1679076014; bh=WMc0jHu+DCh3C
	ThRnkrTuAJWS4NevNVaR/nvCreUHeA=; b=ppngEHLq+lnEeBxK9rlXLgd9UKZnr
	4dfKvnqbfHWQuzXzU/f2m39emRtrMxKWVX/cQwoVD8KnQpdDvFGLEln4Dj+PzAyf
	WrSUiDXxHI300c4TK60npN9b8q32APqpxUn6Sm9WR5+sjkRBqf7/36QvC965Y0NL
	GOqJk3ws7zpAJAHWmDdeYl8CLWDjWlDZrhV86TA6Qdnp5ASgqILoX+11T3JgHzXf
	LWjJvoVpal55eAtBJAq7uLHADJexcNRb/7ORyLX7H7qKttXJ668ZocSfO4004trd
	NUdOJwDCvvxHMCsWm0owg38DNW47EgzcKpR1K3Nbvo/IJAaCfg1O3a9hQ==
X-ME-Sender: <xms:LlkTZLKCZCN5kDhLAojfITR6u59GjyIbk5jXFAa1mZSKIi9nIGf36g>
    <xme:LlkTZPKtRX-0TERun6FIbbeQF3pA9a6o9X_z7cFYvwDHDLPxZf459AdugewXD_JJX
    lt9QfW_pYHMSA>
X-ME-Received: <xmr:LlkTZDvUavn9hCeHd0QdZzPeWfxq7BLlAwX9IhGa7NbuXU0dgImMuVrsh5cAQfbGRArjwUYypAtTuHr7AnCd63Xq-TjOFrtggY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:LlkTZEbLcEIMOr-uDpFkCuP2adh1_XBJ2QZBCZ4yHBKrE7jMatxlPQ>
    <xmx:LlkTZCY1c_U-lnRz4IbxJQSUeWdw4OTaGiJpbrCO9W4rl3Ke-BtO-g>
    <xmx:LlkTZIBhvHf43rwqL-9CTRj4HBCkUxq1Fdmo4bmVFl7OUcacHOtE_w>
    <xmx:LlkTZBmBJTczqmVYQYyQakSOZS0bkHiEVWHk1goW8Pz8XOsz5_f6rQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 16 Mar 2023 19:00:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 1/7] tools/python: Drop pylintrc
Message-ID: <ZBNZK0TEZ2zq4hwV@mail-itl>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlehmI5/pIolRKND"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-2-andrew.cooper3@citrix.com>


--qlehmI5/pIolRKND
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 19:00:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 1/7] tools/python: Drop pylintrc

On Tue, Mar 14, 2023 at 02:15:14PM +0000, Andrew Cooper wrote:
> This was added in 2004 in c/s b7d4a69f0ccb5 and has never been referenced
> since.  Given the the commit message of simply "Added .", it was quite
> possibly a mistake in the first place.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Ideally, we would have a pylint integrated into CI, but given frequency
of changes to that code, I don't think its worth it, so:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>  tools/python/pylintrc | 307 ------------------------------------------
>  1 file changed, 307 deletions(-)
>  delete mode 100644 tools/python/pylintrc
>=20
> diff --git a/tools/python/pylintrc b/tools/python/pylintrc
> deleted file mode 100644
> index efc4b0b3b2dd..000000000000
> --- a/tools/python/pylintrc
> +++ /dev/null
> @@ -1,307 +0,0 @@
> -# lint Python modules using external checkers.                          =
 =20
> -#                                                                       =
        =20
> -#     This is the main checker controling the other ones and the reports=
        =20
> -#     generation. It is itself both a raw checker and an astng checker i=
n order =20
> -#     to:                                                               =
        =20
> -#     * handle message activation / deactivation at the module level    =
        =20
> -#     * handle some basic but necessary stats'data (number of classes, m=
ethods...)
> -#                                                                       =
         =20
> -# This checker also defines the following reports:                      =
             =20
> -#   * R0001: Total errors / warnings                                    =
         =20
> -#   * R0002: % errors / warnings by module                              =
         =20
> -#   * R0003: Messages                                                   =
         =20
> -#   * R0004: Global evaluation                                          =
         =20
> -#=20
> -[MASTER]
> -# Add <file or directory> to the black list. It should be a base name, n=
ot a
> -# path. You may set this option multiple times.
> -ignore=3DCVS
> -
> -# Pickle collected data for later comparisons.
> -persistent=3Dyes
> -
> -# Set the cache size for astng objects.
> -cache-size=3D500
> -
> -
> -
> -[REPORTS]
> -# Tells wether to display a full report or only the messages
> -reports=3Dyes
> -
> -# Use HTML as output format instead of text
> -html=3Dno
> -
> -# Use a parseable text output format, so your favorite text editor will =
be able
> -# to jump to the line corresponding to a message.
> -parseable=3Dno
> -
> -# Colorizes text output using ansi escape codes
> -color=3Dno
> -
> -# Put messages in a separate file for each module / package specified on=
 the
> -# command line instead of printing them on stdout. Reports (if any) will=
 be
> -# written in a file name "pylint_global.[txt|html]".
> -files-output=3Dno
> -
> -# Python expression which should return a note less than 10 (10 is the h=
ighest
> -# note).You have access to the variables errors warning, statement which
> -# respectivly contain the number of errors / warnings messages and the t=
otal
> -# number of statements analyzed. This is used by the global evaluation r=
eport
> -# (R0004).
> -evaluation=3D10.0 - ((float(5 * error + warning + refactor + convention)=
 / statement) * 10)
> -
> -# Add a comment according to your evaluation note. This is used by the g=
lobal
> -# evaluation report (R0004).
> -comment=3Dno
> -
> -# Include message's id in output
> -include-ids=3Dyes
> -
> -
> -
> -# checks for                                                            =
 =20
> -#     * unused variables / imports                                      =
        =20
> -#     * undefined variables                                             =
        =20
> -#     * redefinition of variable from builtins or from an outer scope   =
        =20
> -#     * use of variable before assigment                                =
        =20
> -#    =20
> -[VARIABLES]
> -# Enable / disable this checker
> -enable-variables=3Dyes
> -
> -# Tells wether we should check for unused import in __init__ files.
> -init-import=3Dno
> -
> -# List of variable names used for dummy variables (i.e. not used).
> -dummy-variables=3D_,_1,_2,_3,_4,_5,dummy
> -
> -
> -
> -# checks for :                                                          =
 =20
> -#     * doc strings                                                     =
        =20
> -#     * modules / classes / functions / methods / arguments / variables =
name    =20
> -#     * number of arguments, local variables, branchs, returns and state=
ments in
> -# functions, methods                                                    =
  =20
> -#     * required module attributes                                      =
      =20
> -#     * dangerous default values as arguments                           =
        =20
> -#     * redefinition of function / method / class                       =
        =20
> -#     * uses of the global statement                                    =
        =20
> -#                                                                       =
         =20
> -# This checker also defines the following reports:                      =
             =20
> -#   * R0101: Statistics by type                                         =
         =20
> -#=20
> -[BASIC]
> -# Enable / disable this checker
> -enable-basic=3Dyes
> -
> -# Required attributes for module, separated by a comma
> -required-attributes=3D
> -
> -# Regular expression which should only match functions or classes name w=
hich do
> -# not require a docstring
> -no-docstring-rgx=3D.*
> -
> -# Minimal length for module / class / function / method / argument / var=
iable
> -# names
> -min-name-length=3D1
> -
> -# Regular expression which should only match correct module names
> -module-rgx=3D(([a-z_][a-z0-9_]*)|([A-Z][a-zA-Z0-9]+))$
> -
> -# Regular expression which should only match correct class names
> -class-rgx=3D[A-Z_][a-zA-Z0-9]+$
> -
> -# Regular expression which should only match correct function names
> -function-rgx=3D[a-z_][A-Za-z0-9_]*$
> -
> -# Regular expression which should only match correct method names
> -method-rgx=3D[a-z_][A-Za-z0-9_]*$
> -
> -# Regular expression which should only match correct argument names
> -argument-rgx=3D[a-z_][A-Za-z0-9_]*$
> -
> -# Regular expression which should only match correct variable names
> -variable-rgx=3D[a-z_][A-Za-z0-9_]*$
> -
> -# Good variable names which should always be accepted, separated by a co=
mma
> -good-names=3Di,j,k,ex,Run,_
> -
> -# Bad variable names which should always be refused, separated by a comma
> -bad-names=3Dfoo,bar,baz,toto,tutu,tata
> -
> -# List of builtins function names that should not be used, separated by =
a comma
> -bad-functions=3Dapply,input
> -
> -
> -
> -# checks for sign of poor/misdesign:                                    =
 =20
> -#     * number of methods, attributes, local variables...               =
        =20
> -#     * size, complexity of functions, methods                          =
        =20
> -#    =20
> -[DESIGN]
> -# Enable / disable this checker
> -enable-design=3Dyes
> -
> -# Maximum number of arguments for function / method
> -max-args=3D15
> -
> -# Maximum number of locals for function / method body
> -max-locals=3D15
> -
> -# Maximum number of return / yield for function / method body
> -max-returns=3D6
> -
> -# Maximum number of branch for function / method body
> -max-branchs=3D12
> -
> -# Maximum number of statements in function / method body
> -max-statements=3D50
> -
> -# Maximum number of parents for a class (see R0901).
> -max-parents=3D7
> -
> -# Maximum number of attributes for a class (see R0902).
> -max-attributes=3D7
> -
> -# Minimum number of public methods for a class (see R0903).
> -min-public-methods=3D2
> -
> -# Maximum number of public methods for a class (see R0904).
> -max-public-methods=3D20
> -
> -
> -
> -# checks for :                                                          =
 =20
> -#     * methods without self as first argument                          =
        =20
> -#     * overriden methods signature                                     =
        =20
> -#     * access only to existant members via self                        =
        =20
> -#     * attributes not defined in the __init__ method                   =
        =20
> -#     * supported interfaces implementation                             =
        =20
> -#     * unreachable code                                                =
        =20
> -#    =20
> -[CLASSES]
> -# Enable / disable this checker
> -enable-classes=3Dyes
> -
> -# List of interface methods to ignore, separated by a comma. This is use=
d for
> -# instance to not check methods defines in Zope's Interface base class.
> -ignore-iface-methods=3DisImplementedBy,deferred,extends,names,namesAndDe=
scriptions,queryDescriptionFor,getBases,getDescriptionFor,getDoc,getName,ge=
tTaggedValue,getTaggedValueTags,isEqualOrExtendedBy,setTaggedValue,isImplem=
entedByInstancesOf,adaptWith,is_implemented_by
> -
> -# Tells wether missing members accessed in mixin class should be ignored=
=2E A
> -# mixin class is detected if its name ends with "mixin" (case insensitiv=
e).
> -ignore-mixin-members=3Dyes
> -
> -
> -
> -# checks for                                                            =
 =20
> -#     * external modules dependencies                                   =
        =20
> -#     * relative / wildcard imports                                     =
                   =20
> -#     * cyclic imports                                                  =
        =20
> -#     * uses of deprecated modules
> -#                                                                       =
         =20
> -# This checker also defines the following reports:                      =
             =20
> -#   * R0401: External dependencies                                      =
         =20
> -#   * R0402: Modules dependencies graph                                 =
         =20
> -#=20
> -[IMPORTS]
> -# Enable / disable this checker
> -enable-imports=3Dno
> -
> -# Deprecated modules which should not be used, separated by a comma
> -deprecated-modules=3Dregsub,string,TERMIOS,Bastion,rexec
> -
> -# Create a graph of every (i.e. internal and external) dependencies in t=
he given
> -# file (report R0402 must not be disabled)
> -import-graph=3D
> -
> -# Create a graph of external dependencies in the given file (report R040=
2 must
> -# not be disabled)
> -ext-import-graph=3D
> -
> -# Create a graph of internal dependencies in the given file (report R040=
2 must
> -# not be disabled)
> -int-import-graph=3D
> -
> -
> -
> -# checks for                                                            =
 =20
> -#     * excepts without exception filter                                =
        =20
> -#     * string exceptions                                               =
        =20
> -#    =20
> -[EXCEPTIONS]
> -# Enable / disable this checker
> -enable-exceptions=3Dyes
> -
> -
> -
> -# checks for :                                                          =
 =20
> -#     * unauthorized constructions                                      =
        =20
> -#     * strict indentation                                              =
        =20
> -#     * line length                                                     =
        =20
> -#     * use of <> instead of !=3D
> -#    =20
> -[FORMAT]
> -# Enable / disable this checker
> -enable-format=3Dno
> -
> -# Maximum number of characters on a single line.
> -max-line-length=3D80
> -
> -# Maximum number of lines in a module
> -max-module-lines=3D1000
> -
> -# String used as indentation unit. This is usually " " (4 spaces) or "\t=
" (1 tab).
> -indent-string=3D'    '
> -
> -
> -
> -# does not check anything but gives some raw metrics :                  =
 =20
> -#     * total number of lines                                           =
        =20
> -#     * total number of code lines                                      =
        =20
> -#     * total number of docstring lines                                 =
        =20
> -#     * total number of comments lines                                  =
        =20
> -#     * total number of empty lines                                     =
        =20
> -#                                                                       =
         =20
> -# This checker also defines the following reports:                      =
             =20
> -#   * R0701: Raw metrics                                                =
         =20
> -#=20
> -[METRICS]
> -# Enable / disable this checker
> -enable-metrics=3Dyes
> -
> -
> -
> -# checks for:                                                           =
 =20
> -#     * warning notes in the code like FIXME, XXX                       =
        =20
> -#     * PEP 263: source code with non ascii character but no encoding de=
claration
> -#    =20
> -[MISCELLANEOUS]
> -# Enable / disable this checker
> -enable-miscellaneous=3Dyes
> -
> -# List of note tags to take in consideration, separated by a comma. Defa=
ult to
> -# FIXME, XXX, TODO
> -notes=3DFIXME,XXX,TODO
> -
> -
> -
> -# checks for similarities and duplicated code. This computation may be
> -#     memory / CPU intensive, so you should disable it if you experiment=
s some
> -#     problems.
> -#                                                                       =
         =20
> -# This checker also defines the following reports:                      =
             =20
> -#   * R0801: Duplication                                                =
         =20
> -#=20
> -[SIMILARITIES]
> -# Enable / disable this checker
> -enable-similarities=3Dyes
> -
> -# Minimum lines number of a similarity.
> -min-similarity-lines=3D4
> -
> -# Ignore comments when computing similarities.
> -ignore-comments=3Dyes
> -
> -
> -
> --=20
> 2.30.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qlehmI5/pIolRKND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQTWSoACgkQ24/THMrX
1yyD5Qf8CkpfHFjYexsiWzeXfo6QI7tV+PqbWex79ZyaxVACLBQSPauAhSHKjeLx
CiGFHvP+sAm0wWJmzY9WtoRuUn/AB9qcvVNu9eZk2I7+H4K1FPe9yri783toWsWX
esYvn+N5b22l4gh3mViN0cuuZXRhSnLDUpvr5aHPT+kfpPhXgzl8YdZpOxwJiT0u
u0ma+aA0pNgB4bMWtB2JVdyOZ7QPvJO1bEyjMrINP273JGWkwLI4/byvmHmT+5PX
2lM4zV+znt4lw9eG2/au2Hp56UlJqNFXlXU/gkUpvti2EhbCDNSUVDDCmvvFjoI+
vo2OAAZysJnbl4DF4Z7eoK78TgHXjA==
=phKy
-----END PGP SIGNATURE-----

--qlehmI5/pIolRKND--

