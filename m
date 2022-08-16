Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A501059627D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 20:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388490.625152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO1LW-0002gn-KC; Tue, 16 Aug 2022 18:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388490.625152; Tue, 16 Aug 2022 18:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO1LW-0002eO-HB; Tue, 16 Aug 2022 18:31:22 +0000
Received: by outflank-mailman (input) for mailman id 388490;
 Tue, 16 Aug 2022 18:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dq/F=YU=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1oO1LU-0002eF-7A
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 18:31:20 +0000
Received: from sonic303-25.consmr.mail.gq1.yahoo.com
 (sonic303-25.consmr.mail.gq1.yahoo.com [98.137.64.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c94c683-1d91-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 20:31:17 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Tue, 16 Aug 2022 18:31:14 +0000
Received: by hermes--production-bf1-7586675c46-7c7p2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 624f3e4bccaf700bc143e57e0451f3fc; 
 Tue, 16 Aug 2022 18:31:09 +0000 (UTC)
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
X-Inumbo-ID: 9c94c683-1d91-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1660674674; bh=q8wWOcwuIWp7jF+m+JG95FVHbs3q4ng16JE8P5IIOdI=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=K9QvIDtw9DoDRMNBYJRJtjej7x2KlWO/3XSw1i5V7/XXAQl+8qXuNkK+AiaNNxWr3mdFa8iYnB0Qz9inrjU7KRffjWYiGvnNboWDQ03jvBG353PDLGlK+hZHs8sDQ8V8cKXX+TMuSOccfavZ3Lsnzhh7Sj+V0JfVjAUONxtia6AMNk/fFVeOqmBdIoi73E3AFbS0ijle45g9MjEKeW39KpLYpFfQWcVmu2NufVbfjQ683b7aFwQKyVPEnKz09+BIHFAW2wUR6R9j130AdFpxC2kjiUzRRujI86MY89JAIqLvs4YMxT8o6Hs+WpXqKYWD30DOTrw4pMSwEGt2Mp5QRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1660674674; bh=TsO9OnmVcK62vUwmvFbeK1iVzVOZ3JC5TnUELQbCFUp=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=A4AkXtjlW3Th1SyLhdJg+sWu5of8cenfYMNTs+X/JsChEY4t+VmzwIz5qrN1Q+dW7G5ilNaQk5XXcRlmVkdzYZMZywqyLvyyuqGkjH7LLQ5g5HoKo1OX9PPTy6W1oxpMDIOOZrk7JKsYdbzBdcv3w7rFvTnaPx/EQ3a5l8cslRg8ts7tS7RwBEi+OKyqSV4pJREpzTMmLlhlUEzEZ9xijpRgKBp0N42gClw0PVDwlbResaV4WK5fjZv2+DO5ARn7BBZ5vD+2BUiasmsd2E+VGahIiUhYg/hYJHLJzYXTed5LMQvE0Anw0/2fxK/C5fAhyWr05E6/fTH7HePOYzGXzA==
X-YMail-OSG: .7H3UH4VM1ndSNL34UPAvb5VXC65DpJI_1A2nLTus0F8VmAcAtvonzuYw35.BwF
 Z0KxPlW7ZsFn6ntVRzNmw1hntiywuPKaKJEHJTVDBPmkqZOnEP2SPThPYE1N8uk0ed.cyC5iahSZ
 lGBnevXcFJv0kEm57GY473Hr_EvENwFBrgHzGEsQIi.evuuAkjNprYlVuHBSDRphu.0XcfdKAd2.
 jroHN0yZeOwKCIfIbwkLZ4HdFk8QzlRlDZok7oRypkw3eCe5YZ.SK8wpsTAdon7CRXuM8HHLF2rp
 7pgp961q2jQ3MGvt_wU8AYmRwFtjs8sRnlxc1LoClxXF5F6DWkrVFwKSesA4hN4eNNhDV8zeQoMg
 TcEVQdWJZfnOjFkvWPzTfXHRDNVgGOUL5Shmah7KcoCB6.nybM9E7TCNTUhvupSip1.QMMOF1b7s
 tXYFcutVyj8ixjoCoLpM2G9mtA1CeBHPg4g247ACahtQI8YdANpqkb3Ludvi5MHnCwge77PcE8Xu
 aj5oYSxBxsPZWsURJm7Ewh9yoHzetF25Dn4VihhsFqftv1j.firKa0XDzXhbPZDWgvz9reE5Xbv0
 QXwaX67GiQPWqBzvigKUmoBwPAfqj9LDADk8yIWQIIWYQ6qQdg8lGdiIeXIyKEA0ZJViLBEh.ESo
 S1JrKwJglEVo4sZ7tDTS_IZRvkI0eISOYVSC1BYyTWDmSKmWtvj31PpdSq6UBIGe7mupgP6MkuMT
 jglj5iDHyAcVQD7s.7ySIHu9m.Gwq7l0RIi_AW6yobDI5ORG1Fbid65H69cDppBOpPGFogW0LsrY
 2GXjEj9DLmpZRyKCj19tyyB6kYl5j3WHK0F3zm8mA33Q1PdhpG60ER3TYUH0Vs6LBaxsfH4uz2To
 kNDbNNo0KX9S.UV1jUM0_PsXJBDQamJ1wYIAxQ4ZR1YZuNEf5vskPVnC7THYLQWLsTn8zCD7kLXT
 FLPpi7E4iSLGGLkoS9yV98yp09RvfDiHqq8uVdwJCzpb_w5VovK2yjqFDYOqj57t2zsWfcZFCuht
 k_aHdQA_zQUtWMnHREOTtjCIihxWJWyhjLvX8POb6zGRIH0iv4PxhUnWbVrRRJR_1OPVi8o3wSXs
 9Cx0Egwn4lZBXAPCYOlzwGSyO0YZuJUcO81OuU_B9MwwpyzMWRAGsFCFPxFwCakuxNQ2u8wue3LR
 .dVMc02fn62607azoPfTCb4x7wmIhJPXICl3YpWbfJcAM.IjxLI7P568wJYdg9UG66rJcE1GS9Cc
 sK0ixqn.WlsrwYBvWr2m9yvluinGHWL09uwtukrU3J2SQI13sXses6McK3yBVkQvsQfr9c73eoXZ
 kBVT9CHJ184MwZv97IvdxhzePfzOJTmwAHj4RFCzr3_2sQr04a76emgeWL0fVy1SA6laUvWxwpE.
 .kKsay.yQ_0uQBW78iEFqS3nbcs9yNR4.Dc6_reZ127hZF0hs.l2ElmnvvFEbMLbUrVnk7wlhX3F
 cerH_k6jsNeOvqmmLbDWnsvYgRfLbx0YpLFvlFxTc6nd.Yx5KXSzeUjk_kqDolZi5Qf2XYmcC97T
 1MT53KfJPEZWo8ITgQkEHrFiOmwV6JUitocqsskV0mP1lDCWy.7UGfstiavQJZtgtj8_X4oMaCJr
 Oy88R.eujP97lvb4qvAJd4duiDc5V7LBv5VpGuvMPQA9PSWNwg_kPCnwiROL7L7W6uSlI.wCtHCZ
 zaJOnIW785yLK.YJHT1rwaHUnLust063YDvjhUBPP8p_7YSw44bxY7DFSOCj7jgEPyDEvrFy.5NM
 Zz9Y_ZLYr88oo973XwIQCfAFogR7XkgZdR_Umzk2dkBLjCmF9nVPeibakL8uhwSHoUs6VmdnWxeS
 SZKUpcpKCgd_1cLbztdEHmI4tIDw14v_C9ynRQSLnVtG0M2D_p6LNpf_F3tCeF7Inap_EEcpIPVs
 1kL02wEJbfKytQITMOJTxh3PCafwyGVF5qaFlz6oojdKuYBW0Sl_jXoEJD0OY6S727LruHNnTuTP
 z_f6O84jF7VIZ8bI7hXxyRrjLHXrYKYzYTxL8S3pRSxfwHZi3ou3ipmhw3q.Q_cGGn7unbESaXPd
 qStsh7KwbORv1d9JJNs3W2oV4tgmtE3_OQ.4TbTZfsx.GVAlIxc5w5wvq3HgZ78YsWhyo2p06cJg
 0c3ooMQcnjdq1sxreX0wIPlmRiUC8CCkojpMXaxFlUGFGYmHmoUTIVv3ReURDadGt4l2Legy_eMZ
 d2rwOiM71qaRgmQvN50s-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <a47b2321-4809-f8bc-9eb3-45269ef79ff3@netscape.net>
Date: Tue, 16 Aug 2022 14:31:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: PING [PATCH 3/3] x86: decouple pat and mtrr handling
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Borislav Petkov <bp@alien8.de>
Cc: Juergen Gross <jgross@suse.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, regressions@lists.linux.dev
References: <20220715142549.25223-1-jgross@suse.com>
 <20220715142549.25223-4-jgross@suse.com> <YtbKf51S4lTaziKm@zn.tnic>
 <d838264a-bcd0-29e2-3b23-5427ee0ee041@netscape.net>
 <YvfdYS81vU66tQSs@zn.tnic>
 <3de36953-9b8a-d040-c8dd-44af1ae2d56d@netscape.net>
 <YvgcIu/Y1GMD5WNo@zn.tnic>
 <6e709192-064d-fdfb-8596-6474d891dd7f@netscape.net>
Content-Language: en-US
In-Reply-To: <6e709192-064d-fdfb-8596-6474d891dd7f@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20531 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 8/13/2022 6:41 PM, Chuck Zmudzinski wrote:
> On 8/13/2022 5:48 PM, Borislav Petkov wrote:
> > On Sat, Aug 13, 2022 at 05:40:34PM -0400, Chuck Zmudzinski wrote:
> > > I did a search for Juergen Gross on lkml and he is active submitting and
> > > reviewing patches during the past few weeks. However, he is ignoring
> > > comments on his patch to fix this regression.
> >
> > Please stop this non-sense and be patient. We will fix this soon. For
> > the time being you can use Jan's patch locally.
> >

Hi Boris,

I see you have signed off on Jan's patch with a slight modification as
the short-term fix that is also tagged to be backported to stable. Thank you!
I hope no other problems or objections pop up and Linus will merge it into
the mainline kernel soon. Please forgive me for my impatience.

Best regards,

Chuck

