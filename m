Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C886CAC7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687140.1070090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgtq-0007rl-IS; Thu, 29 Feb 2024 13:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687140.1070090; Thu, 29 Feb 2024 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgtq-0007oZ-FR; Thu, 29 Feb 2024 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 687140;
 Thu, 29 Feb 2024 13:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfgto-0007nf-T1
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:56:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a1abfe3-d70a-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 14:56:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 163241F7E9;
 Thu, 29 Feb 2024 13:56:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8867713503;
 Thu, 29 Feb 2024 13:56:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0Ki5HxKN4GWlGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 13:56:34 +0000
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
X-Inumbo-ID: 5a1abfe3-d70a-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709214995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NK+sPAoplNtwgn2K6tYI+HQfXfK23WDATXWG9Cmn1cI=;
	b=KAIRMexNlJhuE5wRYxaYQylkZDdRk5LuqCyFPAIB8sENP9+grHVUnptEysRahSSimTAk14
	hSrmvXTl0c689++DfmiMrIcbVmOMKyPCBZe8UhcxGIEx+nSlkFb76LpG9HnfR/yq/rd5vR
	FY+4dGqkuuJPRO5qh6ewRg7ny3qVIII=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709214995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NK+sPAoplNtwgn2K6tYI+HQfXfK23WDATXWG9Cmn1cI=;
	b=KAIRMexNlJhuE5wRYxaYQylkZDdRk5LuqCyFPAIB8sENP9+grHVUnptEysRahSSimTAk14
	hSrmvXTl0c689++DfmiMrIcbVmOMKyPCBZe8UhcxGIEx+nSlkFb76LpG9HnfR/yq/rd5vR
	FY+4dGqkuuJPRO5qh6ewRg7ny3qVIII=
Message-ID: <2605cc82-dec2-42af-acba-e7170c2929d9@suse.com>
Date: Thu, 29 Feb 2024 14:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
 <d9b1a07c-d1b6-4bc1-a12f-396620ea7d24@suse.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <d9b1a07c-d1b6-4bc1-a12f-396620ea7d24@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yEbwmL2dYTXqUfPBHj0P1TFZ"
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=KAIRMexN
X-Spamd-Result: default: False [-6.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 163241F7E9
X-Spam-Level: 
X-Spam-Score: -6.70
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yEbwmL2dYTXqUfPBHj0P1TFZ
Content-Type: multipart/mixed; boundary="------------d2tNLeOOzGMQN1wlZkUxq066";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
Message-ID: <2605cc82-dec2-42af-acba-e7170c2929d9@suse.com>
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
 <d9b1a07c-d1b6-4bc1-a12f-396620ea7d24@suse.com>
In-Reply-To: <d9b1a07c-d1b6-4bc1-a12f-396620ea7d24@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------d2tNLeOOzGMQN1wlZkUxq066
Content-Type: multipart/mixed; boundary="------------2negF6jxm6H0mufd0Ddf72UJ"

--------------2negF6jxm6H0mufd0Ddf72UJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDIuMjQgMTQ6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4xMi4yMDIz
IDEwOjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gcHJlcGFyZSBh
IHR5cGUtc2FmZSByZWN1cnNpdmUgc3BpbmxvY2sgc3RydWN0dXJlLCBhZGQNCj4+IGV4cGxp
Y2l0bHkgbm9uLXJlY3Vyc2l2ZSBsb2NraW5nIGZ1bmN0aW9ucyB0byBiZSB1c2VkIGZvciBu
b24tcmVjdXJzaXZlDQo+PiBsb2NraW5nIG9mIHNwaW5sb2Nrcywgd2hpY2ggYXJlIHVzZWQg
cmVjdXJzaXZlbHksIHRvby4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiBwcmVmZXJhYmx5IHdpdGggLi4uDQo+IA0KPj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NwaW5sb2NrLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlu
bG9jay5oDQo+PiBAQCAtMTAxLDYgKzEwMSw4IEBAIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhl
YWQgew0KPj4gICB9Ow0KPj4gICANCj4+ICAgI2RlZmluZSBfTE9DS19QUk9GSUxFKGxvY2tu
YW1lKSB7IC5uYW1lID0gI2xvY2tuYW1lLCAubG9jayA9ICZsb2NrbmFtZSwgfQ0KPj4gKyNk
ZWZpbmUgX1JMT0NLX1BST0ZJTEUobG9ja25hbWUpIHsgLm5hbWUgPSAjbG9ja25hbWUsIC5y
bG9jayA9ICZsb2NrbmFtZSwgICAgIFwNCj4+ICsgICAgLmlzX3Jsb2NrID0gMSwgfQ0KPiAN
Cj4gLi4uICJ0cnVlIiB1c2VkIGhlcmUsIC4uLg0KPiANCj4+IEBAIC0xMzMsMTMgKzEzNSwx
NiBAQCBzdHJ1Y3QgbG9ja19wcm9maWxlX3FoZWFkIHsNCj4+ICAgICAgICAgICAgICAgYnJl
YWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPj4gICAgICAgICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiAgICAgICAg
ICAgcHJvZi0+bmFtZSA9ICNsOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4+IC0gICAgICAgIHByb2YtPmxvY2sgPSAmKHMpLT5s
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
PiArICAgICAgICBwcm9mLT5sb2NrcHRyID0gJihzKS0+bDsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gKyAgICAgICAgcHJvZi0+aXNfcmxv
Y2sgPSBpc3I7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4+ICAgICAgICAgICBwcm9mLT5uZXh0ID0gKHMpLT5wcm9maWxlX2hlYWQuZWxl
bV9xOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gICAgICAgICAgIChz
KS0+cHJvZmlsZV9oZWFkLmVsZW1fcSA9IHByb2Y7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+PiAgICAgICB9IHdoaWxlKCAwICkNCj4+ICAgDQo+PiAtI2Rl
ZmluZSBzcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwpIF9fc3Bpbl9sb2NrX2luaXRfcHJvZihz
LCBsLCBzcGlubG9ja190KQ0KPj4gLSNkZWZpbmUgcnNwaW5fbG9ja19pbml0X3Byb2Yocywg
bCkgX19zcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwsIHJzcGlubG9ja190KQ0KPj4gKyNkZWZp
bmUgc3Bpbl9sb2NrX2luaXRfcHJvZihzLCBsKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgX19zcGluX2xvY2tfaW5pdF9wcm9mKHMs
IGwsIGxvY2ssIHNwaW5sb2NrX3QsIDApDQo+IA0KPiAuLi4gImZhbHNlIiBoZXJlLCAuLi4N
Cj4gDQo+PiArI2RlZmluZSByc3Bpbl9sb2NrX2luaXRfcHJvZihzLCBsKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gKyAgICBfX3NwaW5fbG9j
a19pbml0X3Byb2YocywgbCwgcmxvY2ssIHJzcGlubG9ja190LCAxKQ0KPiANCj4gLi4uICJ0
cnVlIiBhZ2FpbiBoZXJlLCBhbmQgLi4uDQo+IA0KPj4gQEAgLTE3NCw2ICsxNzksNyBAQCBz
dHJ1Y3QgbG9ja19wcm9maWxlX3FoZWFkIHsgfTsNCj4+ICAgDQo+PiAgICNlbmRpZg0KPj4g
ICANCj4+ICsNCj4+ICAgdHlwZWRlZiB1bmlvbiB7DQo+PiAgICAgICB1aW50MzJfdCBoZWFk
X3RhaWw7DQo+PiAgICAgICBzdHJ1Y3Qgew0KPiANCj4gLi4uIGRlZmluaXRlbHkgd2l0aCB0
aGlzIGh1bmsgZHJvcHBlZC4NCg0KSSdtIGZpbmUgd2l0aCBhbGwgb2YgYWJvdmUuDQoNCg0K
SnVlcmdlbg0KDQo=
--------------2negF6jxm6H0mufd0Ddf72UJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------2negF6jxm6H0mufd0Ddf72UJ--

--------------d2tNLeOOzGMQN1wlZkUxq066--

--------------yEbwmL2dYTXqUfPBHj0P1TFZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXgjREFAwAAAAAACgkQsN6d1ii/Ey+O
pwf8CqziVk6M590Gsq9+9fptOswnyu7igDR/m635N8fty3skUNArPQLMQ54vqHG6604031ot1y7b
sNng+tzpflIs09O8EiakD5gXehoBJxbtX0LD/MRiONjAcpL6vs8L0eZRWMOd/tB0+aURg2ZYPG1D
qCGwqXBWJfuDGRmoHsvuAnVdXjpcpPus3pzQz5PBIysSk3I9JuBGCjZD01iaR8IlSy8MTgej8kHc
xMY5vE292EC+b74vRbLkYqVSEILhFrvDsJwC3fnA3lNLh4NnS/Zpr+WLf2VZ2weukfLvdk0MXpr2
FTkE+Ja9DA/sKC/aLIwtkaBiPTpleVCZpvXvR3lTtQ==
=wXqe
-----END PGP SIGNATURE-----

--------------yEbwmL2dYTXqUfPBHj0P1TFZ--

