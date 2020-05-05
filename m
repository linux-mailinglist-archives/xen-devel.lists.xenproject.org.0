Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD841C558F
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 14:37:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVwo1-0001KR-Sq; Tue, 05 May 2020 12:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVwo0-0001KM-Um
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 12:36:12 +0000
X-Inumbo-ID: ff7bbca8-8ecc-11ea-9db2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff7bbca8-8ecc-11ea-9db2-12813bfff9fa;
 Tue, 05 May 2020 12:36:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB20BAB3D;
 Tue,  5 May 2020 12:36:11 +0000 (UTC)
Subject: Re: [PATCH v8 07/12] x86emul: support FNSTENV and FNSAVE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <9a2afbb1-af92-2c7d-9fde-d8d8e4563a2a@suse.com>
Message-ID: <947612c1-8d6b-c484-e080-0d35bfb9bb3c@suse.com>
Date: Tue, 5 May 2020 14:36:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9a2afbb1-af92-2c7d-9fde-d8d8e4563a2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 10:15, Jan Beulich wrote:
> @@ -11542,6 +11611,12 @@ int x86_emul_blk(
>      switch ( state->blk )
>      {
>          bool zf;
> +        struct {
> +            struct x87_env32 env;
> +            struct {
> +               uint8_t bytes[10];
> +            } freg[8];
> +        } fpstate;

This also needs #ifndef X86EMUL_NO_FPU around it for !HVM builds
to work.

Jan


