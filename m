Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438F47BE48
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 11:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250290.431119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzcdf-0002kf-Sg; Tue, 21 Dec 2021 10:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250290.431119; Tue, 21 Dec 2021 10:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzcdf-0002ir-P3; Tue, 21 Dec 2021 10:44:59 +0000
Received: by outflank-mailman (input) for mailman id 250290;
 Tue, 21 Dec 2021 10:44:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzcde-0002il-8L
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 10:44:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08b06d41-624b-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 11:44:56 +0100 (CET)
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
X-Inumbo-ID: 08b06d41-624b-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640083496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NFh01Z89MiMRh83q5rwihdC/3dcH9m4/94T6EpSM6D4=;
  b=awPW1upkyyzQnc617G3E+ncd7km0oBhHSuWoHPmazn1SVU69iZSAKsEu
   7nRbl6uItYOb4HEBD6vt9jPyrbkS3l6lUwbAfmZZap3l8ZRpWTz0+ju8w
   iR+u59z0ZUR7ykZukNgfv3eIvyCB7O6RbmqlstGGmD1XVy1xW8GA5OOjy
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ja0SI1wxXJ//e/YHuO/7m75Y4nK5wAHA4EDYaVHgzPbgNigoTIEdFGk16hP3cF5TTPnQESrkZs
 eLxptRml5W9k58ZqA3otPVzIct0KnvyNAQ9dn98fpB/mWgSt8PxqrJBwkJvNgaXdmMEqEb/YIY
 4Tg4ZfgnHm+RS/zavFIwUzjKGQh2NiLVOaNWz1XFYIsqH6qtG6numEA4N89nDCdFuY3COKSaF0
 p3a8c8Ri7OD7mmeNtjvR+5mdwZraTrTvgm8SyzIvj32v0Gqj38q+eKQT7BCpg+czfdbhJH7/4x
 WnJ/bVlPe1GNN3XtCGh2OxuH
X-SBRS: 5.1
X-MesageID: 59992861
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L6/QpapAXezC/i/dxQfGTxN/g55eBmLVYhIvgKrLsJaIsI4StFCzt
 garIBnVafaDMWqnLtgnbImx80tSvJKAxtNmS1Y//3o9H3sR85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2Ncx24LgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZq9Cho3Oqzso9wEdikGLTFBPoIY4bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ptIOGA/Mk2ojxtnOm0VWao+jLyTpnD1UBZauHCnjqsR/D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcU85UKQ1K7Vwz2hH000EABRV98J6tY5EGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHvJ6sz67DFzFtW
 UTofeDEtIji6rnXy0SwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpcIWW0P
 xOJ4FgLjHO2AJdMRfUvC25WI551pZUM6Py/DqyEBjawSsUZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dJJcA1RcyFkXcueRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:/OhiVKtyIsu+MzXmQsL7X/Ea7skDWtV00zEX/kB9WHVpm5Sj5q
 STdPRy73PJYUUqKRYdcLG7SdK9qBznlaKdjbN6AV7mZniChILKFvAZ0WKB+UyCJ8SWzIc0vp
 uIMZIOauEYZmIUsS+O2miF+qEbruVvnprEuQ6U9QYKcegjUdAY0+5WMHfiLnFL
X-IronPort-AV: E=Sophos;i="5.88,223,1635220800"; 
   d="scan'208";a="59992861"
Date: Tue, 21 Dec 2021 10:44:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xenperf: omit meaningless trailing zeroes from output
Message-ID: <YcGwH9s6sfS+hdCV@perard>
References: <18f57385-9a17-fc23-85e0-9d4a35c79ac8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <18f57385-9a17-fc23-85e0-9d4a35c79ac8@suse.com>

On Tue, Dec 21, 2021 at 10:59:27AM +0100, Jan Beulich wrote:
> There's no point producing a long chain of zeroes when the previously
> calculated total value was zero. To guard against mistakenly skipping
> non-zero individual fields, widen "sum" to "unsigned long long".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

