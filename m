Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B974A62B5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 18:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263734.456580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEx97-0003xM-43; Tue, 01 Feb 2022 17:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263734.456580; Tue, 01 Feb 2022 17:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEx97-0003uh-0D; Tue, 01 Feb 2022 17:40:49 +0000
Received: by outflank-mailman (input) for mailman id 263734;
 Tue, 01 Feb 2022 17:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rj0=SQ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nEx95-0003uS-1K
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 17:40:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f9bc61-8386-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 18:40:45 +0100 (CET)
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
X-Inumbo-ID: 14f9bc61-8386-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643737245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSakzW8F1T/IHOqc59Wxu5gOKZD94g7wpSbjHNYv9ZU=;
  b=BUt+p2v4Fs+LskU/aoj8XhY5yiHRYLpFfqzJGdPgvxV14TRxA569owjy
   bwF2+0Z+p/zlhBpt7xxWtlo2OYfCaSMGXWFAAJZpX9v2JQF0A79mYSd7e
   Msy0iO/wTeGE+9yEdqsJRcJVQzm/qlPmtfwLJL9xzT42DoGv3H/Zja9lV
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AafiltsoL0TguCcVzZa34CYbGrxYH+KZ96q+N5bfX8CxPg2UNPaUA9TYLhRwZQQQSsnvbOpP/w
 FMO7d9Jos18CmX+7tclA1jvno+5kFDBPM0tmHvGq4VIjSFzpMo27HsrVf9OUZMorMyNavHTV5h
 3u4Y5iu09/9up8b7DmSh9HICjmcKEMdMCtsiF/kg4RLXa1nL2AtwWgUPdEyBLr+D8OJB71tSZM
 zPXZ2C5YnafZ1/gkOeQv0+NJBEJtYgEDS6bsXLPBMTdbPpTZhhrEyTTe8zqYKUa3lUPGl9QG/H
 ZGYj0J/oBfFeS+W18BlaNgaF
X-SBRS: 5.2
X-MesageID: 63649787
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3ovbk6yuXsLzEpYUqfR6t+fmwSrEfRIJ4+MujC+fZmUNrF6WrkUPy
 mZNCjzSbK3ZNGH3ftlybY2z908FscDQn4BhGQc9ryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZg2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+9Y8
 eVPsraecCASOK3xqMgjTxd7TD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JsQQaeBN
 5VxhTxHaRDmYAx2CF4sB6kQgPuNt1jBaC1akQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqFiSzWwaDFsRT0m2pdGwkEv4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJvOtQK6gan5JPz2ACZO1gocCJPS4M54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HygbQ4xawZRGp8crVnl
 CJe8yR5xLtWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBw0YplcKWG4P
 B67VeZtCHl7ZiHCgUhfONrZNijX5fK4SYSNug78M7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOG8yT50n5gNK2OS7EIZ9YYQDmRr1os8u5TPD9r
 ow32z2ikUsPCYUTo0D/rOYuELz9BSNqWMmr+5ELLbPrz8gPMDhJNsI9CIgJI+RN95m5XM+Ul
 p1kckMHmlf5m1PdLgCGNiJqZL/1BM4tpnMnJy08e12v3iF7M4qo6a4ecboxfKUmq7M/naIlE
 aFddpXSGOlLRxTG5y8ZMcv3ort9eUn5ngmJJSekPmQyJsYyWwzT99b4VQLz7y1SXDGvvM4zr
 uT4hAPWSJYOXSp4C8PSZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpB/LvDuY449tXNlJuolYbxHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwK9itdvio7hWklZtEHnRNgn5D7phJj+N3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GrtiZ48Y2OXVhWIxTR2jdWK6F4Md99z
 Oos0CLMB9dTVvb+3g66sx1p
IronPort-HdrOrdr: A9a23:VHVWdavOluyVrwEcuQC+/vnf7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,334,1635220800"; 
   d="scan'208";a="63649787"
Date: Tue, 1 Feb 2022 17:40:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal Orzel <michal.orzel@arm.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/configure.ac: Replace macro AC_HELP_STRING
Message-ID: <Yflwk30RLgUWECFF@perard>
References: <20220201170321.32510-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220201170321.32510-1-michal.orzel@arm.com>

On Tue, Feb 01, 2022 at 06:03:21PM +0100, Michal Orzel wrote:
> ... with AS_HELP_STRING as the former is obsolete according
> to GNU autoconf 2.67 documentation.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

