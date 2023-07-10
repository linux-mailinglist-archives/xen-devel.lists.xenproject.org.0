Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4DB74D82A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 15:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561216.877618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIrIO-0004vA-IX; Mon, 10 Jul 2023 13:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561216.877618; Mon, 10 Jul 2023 13:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIrIO-0004sz-FY; Mon, 10 Jul 2023 13:51:20 +0000
Received: by outflank-mailman (input) for mailman id 561216;
 Mon, 10 Jul 2023 13:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfHP=C4=citrix.com=prvs=5481289c3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qIrIN-0004sa-KQ
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 13:51:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6c83b95-1f28-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 15:51:17 +0200 (CEST)
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
X-Inumbo-ID: d6c83b95-1f28-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688997077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iiACUOUu7fIuxgLUtMMhtGHPmApMR/pDsULP0BTcWo0=;
  b=duYdibjCH1voyB3nUCOs4gZai0kxk4lWgjWh/j02N+14IlWny629EOYN
   uZtPgpDRLwUof9NQqyAKqeNofzBDYaaeZymQ8Zad32w8NjMU2izYWuBGH
   KmHeR74d+m/vfb5+j1hi3vwgz5RciDa75ejhStrk3ELnwEVAZrn143Dtr
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118279729
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:mAKkt6lOzFCCxfFKuREi2Qro5gxTJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCGuDP/jYamP0eNogYInj808A6sDRxt5iGgNv+yExHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5QeGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f8Hbz8cSUmpvOj1x7mLFfU93OR+fPC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/B9
 jiZrjujU3n2MvSH+yKAtXGD39Pexz/iYagsOp6J1qRl1Qj7Kms7V0RNCArTTeOColazR99Fb
 UwT6yc1haEo8QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOvsIsWSYj0
 FPPmtrzHCFuq5WcU3fb/bCRxRutNClTJm8PYwcNVw5D6N7myKk3kxnGCNhqFqW4itnoMTjqx
 naBqy1Wr6oXpd4G0eO851+vqzu0q4LAVAId+gTdVWXj5QR8DLNJfKTxtwKdt6wZat/EEB/Y5
 iNsd9WiAP4mDo7Kmz2qGc82FvKu7MbaLGyGoQM/Jsx0n9iywEJPbby88Rknehc5Y5xYJWS2C
 KPAkVgPvcEOZRNGeYcyOtvsUJpykMAMAPy/Dpjpgsxyjo+dneNt1AVnfgau0m/kiyDAeolva
 M7AIa5A4Zv3YJmLLQZapM9Hi9fHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyLo
 4YObZTUlU8DC7GWjszrHWk7dABiEJTGLcqu95w/mhCrf2KK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AOXuJEzEi3TMioLQOq2Df5CQYcTYXRE0aCAhyJyPu5CLc43K/MKQFXQ3LA6nKQsE
 ahYIZTo7zYmYm2vxgnxpKLV9ORKHClHTyrXV8Z5SFDTp6JdejE=
IronPort-HdrOrdr: A9a23:1GCRWKBJcDYu7GzlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:9L2lJGFuYVheHIyWqmJk6wkbC+d8WEbXj3DbExCkWDxJFe2sHAo=
X-Talos-MUID: 9a23:VR1epgtc1aRr7HdDXs2nnAN6MYBrzP2SGRoRiKwsheenBAwqNGLI
X-IronPort-AV: E=Sophos;i="6.01,194,1684814400"; 
   d="scan'208";a="118279729"
Date: Mon, 10 Jul 2023 14:50:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Hoyes <peter.hoyes@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, <luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] tools/console: Add escape argument to configure
 escape character
Message-ID: <965c66df-1423-4784-aba4-e7df6c097c9a@perard>
References: <20230622141248.459133-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230622141248.459133-1-peter.hoyes@arm.com>

On Thu, Jun 22, 2023 at 03:12:47PM +0100, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Dom0 may be accessed via telnet, meaning the default escape character
> (which is the same as telnet's) cannot be directly used to exit the
> console. It would be helpful to make the escape character customizable
> in such use cases.
> 
> Add --escape argument to console tool for this purpose.
> 
> Create parse_escape_character static function to convert a character
> string (which may include a '^' modifier) into an ANSI integer.
> 
> Add argument to getopt options, parse escape character and pass value
> to console_loop.
> 
> If --escape is not specified, it falls back to the existing behavior
> using DEFAULT_ESCAPE_SEQUENCE.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  tools/console/client/main.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/console/client/main.c b/tools/console/client/main.c
> index 6775006488..fb7cfb04b5 100644
> --- a/tools/console/client/main.c
> +++ b/tools/console/client/main.c
> @@ -42,7 +42,7 @@
>  #include <xenstore.h>
>  #include "xenctrl.h"
>  
> -#define ESCAPE_CHARACTER 0x1d
> +#define DEFAULT_ESCAPE_CHARACTER 0x1d
>  
>  static volatile sig_atomic_t received_signal = 0;
>  static char lockfile[sizeof (XEN_LOCK_DIR "/xenconsole.") + 8] = { 0 };
> @@ -77,6 +77,7 @@ static void usage(const char *program) {
>  	       "  -n, --num N      use console number N\n"
>  	       "  --type TYPE      console type. must be 'pv', 'serial' or 'vuart'\n"
>  	       "  --start-notify-fd N file descriptor used to notify parent\n"
> +	       "  --escape E       escape sequence to exit console\n"
>  	       , program);
>  }
>  
> @@ -174,7 +175,7 @@ static void restore_term(int fd, struct termios *old)
>  }
>  
>  static int console_loop(int fd, struct xs_handle *xs, char *pty_path,
> -		        bool interactive)
> +			bool interactive, char escape_character)
>  {
>  	int ret, xs_fd = xs_fileno(xs), max_fd = -1;
>  
> @@ -215,7 +216,7 @@ static int console_loop(int fd, struct xs_handle *xs, char *pty_path,
>  			char msg[60];
>  
>  			len = read(STDIN_FILENO, msg, sizeof(msg));
> -			if (len == 1 && msg[0] == ESCAPE_CHARACTER) {
> +			if (len == 1 && msg[0] == escape_character) {
>  				return 0;
>  			} 
>  
> @@ -335,6 +336,7 @@ int main(int argc, char **argv)
>  		{ "help",    0, 0, 'h' },
>  		{ "start-notify-fd", 1, 0, 's' },
>  		{ "interactive", 0, 0, 'i' },
> +		{ "escape",  1, 0, 'e' },
>  		{ 0 },
>  
>  	};
> @@ -345,6 +347,7 @@ int main(int argc, char **argv)
>  	console_type type = CONSOLE_INVAL;
>  	bool interactive = 0;
>  	const char *console_names = "serial, pv, vuart";
> +	char escape_character = DEFAULT_ESCAPE_CHARACTER;
>  
>  	while((ch = getopt_long(argc, argv, sopt, lopt, &opt_ind)) != -1) {
>  		switch(ch) {
> @@ -375,6 +378,12 @@ int main(int argc, char **argv)
>  		case 'i':
>  			interactive = 1;
>  			break;
> +		case 'e':
> +			if (optarg[0] == '^')
> +				escape_character = optarg[1] & 0x1f;
> +			else
> +				escape_character = optarg[0];
> +			break;

Could you check that `optarg` actually contains a valid escape
character sequence? Either only 1 character, or '^' followed by only one
char.

(If one want to use the NUL char to escape, it should set ^@, not '' or
'^'.)

Thanks,

-- 
Anthony PERARD

