Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29E4A85B9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264804.458049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFckQ-00074Z-Lc; Thu, 03 Feb 2022 14:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264804.458049; Thu, 03 Feb 2022 14:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFckQ-00071V-IU; Thu, 03 Feb 2022 14:06:06 +0000
Received: by outflank-mailman (input) for mailman id 264804;
 Thu, 03 Feb 2022 14:06:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFckO-00070F-Oy
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:06:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69fe9edf-84fa-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 15:06:01 +0100 (CET)
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
X-Inumbo-ID: 69fe9edf-84fa-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643897161;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AFKNSxzQq822lpZOMTbQdJjj9OdDp3Os1we92Rqt4Vo=;
  b=IieIDmn7vvllPOqmUNKlhJaYIIaWOgg4vws7xIw/grySs3hXNB9e/jQB
   EjdkHq08RRPsBuvNqC2AUE7r3kq+v5JeXDRHdC7VtV/lgg/3LqeVjjiFT
   4rQN7d9PtwPrzxQxhmmngXBP3IOM/3YOtmfUlaup1fNj+oQOOGE3bWBH6
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rjcPPiKvhURkGwfAVZNZ2O4IOWplLIOeKyil5DOMI9wdCGiN7HAn6xLVnXUm6LSEE8sr/4LWV2
 tXV0vaF7ecfu1FefQAGu9DR84YUmh5Qj0uvSgtgt01WZrOnLF98H3AZtB5GQYxwmZ7jYkr7W0/
 1rO09V3WKjgG7n33HCXfCZZeFwLmjNJdrW0SZHJZ1yKoohAiWPG+wpxDTER4t6m6LYbrADKXzf
 skjV0+EFasFoq4TCsuTFBl4Y9ZMvHUO7f/5lX5tiaq0CnR6Xs5jSABgkqk0oK3KA6Tz1vKy+L0
 fxk=
X-SBRS: 5.2
X-MesageID: 63328879
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+VEB06PizotvbZrvrR3NkMFynXyQoLVcMsEvi/4bfWQNrUog1DBTn
 GFKXm3Sa62MYWqme9ona4+w/UhXvpSDmoJmTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o4w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozbV3Ox90
 YRPj7OtGQM4EYHvyfU8fDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvoUIjGhh7ixINc2OX
 +k+TxVlV0XnbTJfOlsNIrc0uuj90xETdBUH8QnI9MLb+VP75RZt3b3aFcvac92HW+1Yhk+d4
 GnB+gzRPBYeM9COzCufxViljOTPgCDTVZobEfuz8fsCqEWa22g7GBAQE1yhrpGRkEe+RtYZM
 E0S9SoGpLI3skesS7HVVRCivGSNuBJaXtNKCvA78ymE0K+S6AGcbkAjSjNCc9UguNUBeS0x1
 lSJktXqAhRiqLSQD3ma89+8rzm/JCwUJm8qfjIfQE0O5NyLiKY3gxHUR9BvCpmciNHvBCrwy
 DCHqis5r7gLhMtN3KK+lXjXjjTpqpXXQwod4gTMQnnj/g5/fJSiZYGj9R7c9/koBJ2CUlCLs
 XwAms6fxOMDF5eAkGqKWuplNLO04/eINhXMjFgpGIMunwlB4Fb6I9oWumsnYh40bIBUIlcFf
 XM/pytSuNxvMGL7b5VYftK1GusG7vnxNPvMA6W8gsV1XrB9cwqO/SdLbEGW3nzwnEVErZzTK
 at3Yu73Uy9EVP0PIC6eAr5EjOR1nnxWKXb7GMijpylLx4Zyc5J8pV0tFFKVJt4046qfyOk+2
 4YObpDao/mzvQCXX8U2zWLxBQ1SRZTYLcqvwyCySgJlClA9cI3GI6SJqY7Ng6Q/w8xoeh7gp
 xlRoHNwxlvlnmHgIg6XcH1lY76Hdc8h8SlrZnFyYAfzhCNLjWOTAEE3LcBfkV4Pr7QL8BKJZ
 6NdJ5Xo7gpnFlwrBAjxnbGi9dc/JXxHdCqFPja/YShXQnKTb1ehxzMQRSO2rHNmJnPu7aMW+
 uT8viuGH8Zrb1k8Xa7+NaL+p3vs7CN1sL8jACP1zix7JR+EHH5CcXKh15fa4qgkdH3++9dt/
 13HXE5F9bSR+NJdHRugrfnskrpF2tBWRyJyN2La8ay3JW/d+G+iypVHS+GGYXbWU2acxUloT
 bw9I1zUYKVZ9LqWm+KQy4pW8J8=
IronPort-HdrOrdr: A9a23:cHi8jaH2J0abqvGDpLqFcJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9dVfYd1P7srhJJGdZc8qPSMex7wqDL3QSuvyAfcZek600ykke+D3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.88,340,1635220800"; 
   d="scan'208";a="63328879"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHsezH2bVg1r4v/udyqxnT5fA09WOKApK89RNo/kzfD1ay2/Hz3DOzHCHkNCeZHhkxdDHfsyEyvWfjN/u54F1n67sAdsQ+inmywBAGy33fZ4D4xG5dUGWdUQFpIIiiMAbKqhjAX7omFxjZWdiRlH0fwTvOdnjj9K0EF9S/P79U4SD6MMCQA426nhzxCbgKpRfr0dpwkJdaVrUVlRuMy59hoDjXsZNTjEmVnDmV57CKsrDvtO+MnMn35mZLfDDllo7Xjqhbm4WWhRzJNPl+B04XnUK1V+1j0ACBmlw5/Uy+54PpKk5UvJUoxVSYA+xPTOYfwrf2pxGR7oSCq/xVJHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CS7V07AIdkGI252hKVMxsoOyL2HAZKXrXAMBhnxgCB4=;
 b=nm89MeaHr9hjoAgasb157cUVbcoTZUj5J+nmQfwCLIvX9fDA/H1/oVVyNPr7EyPgb83dFplLKpjBvaTCoJcmfFkDYJwVLu7knVS0B11AIxl1luDU3zBEJT4e1IHQJmxCjVAB0sWf4EhWlhwicX1Jd5iv+gO3Y68MNkNrFTmw7Ov2w40lwYKXPt221FbQUuj3/Qsz5aQdVaAxAMAsFe17B/dSh4NAJrLC7hY7vBw35cbiSu11YergVLmuN5dbMixK0bNuW+XkZ40F7BcdDoHH/hn+TU/XEhu8GnftJbPvfIk9RcYOC6nvGHf3f5ZhTDRrLVz/IXTwfs3G1Tc5ebWTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CS7V07AIdkGI252hKVMxsoOyL2HAZKXrXAMBhnxgCB4=;
 b=P0LK2xH6cu0/1z6CrRboV91c03+VhXtc09QNs4aEZafnCTzbbITGu5GBJqpmYrAHtUKpKJ5oafVetkFvpsiy95wxzWc/y//PygIC7VaEvEcacBef5qRajnlQEP6qf5pe6eltMDHVsoP9KL/xasCDi5zlhD89TcdJyEwKMY1mcOo=
Date: Thu, 3 Feb 2022 15:05:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <YfvhOmbFxjKdjI2x@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
 <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
 <9c1f376a-0df3-67eb-7fd1-bb75ae130e77@suse.com>
 <0171761f-d90f-3e3a-5c8f-e32d70096e27@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0171761f-d90f-3e3a-5c8f-e32d70096e27@epam.com>
X-ClientProxiedBy: LO2P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85d90df5-6dac-46df-445d-08d9e71e48f9
X-MS-TrafficTypeDiagnostic: BYAPR03MB4645:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB464548E54ADDBE22856BC7478F289@BYAPR03MB4645.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YckT3gyByQwKvKir3LoD03W3dOx3wuhFDDkgNJmiYf9fTWDBWT9YFV1Ge0DaLJlAv3pu+nGgH2mqNQJSr5BeTDMASGz368kwrU0nYjVyOSg+vTQLfb4YBud6RMIgKANSOsZL8e6Q2G7Z9dAzZaWwXg/9cGbbisDXIT/wOYxjRfnEnj6aj4IOC0ghADkZZ3v0GXK7w7V9Nri5kHShCakDZDY7bzwjIXiz8RwY33Wt65zM/BBNizm2dzZ6Tr2KBv+VonVSsf+ojVMuSWl0O2KpCYF+nrlenDtQD+8mIqeqFD03IunXOnYk8EfK0XGayzh5LF7liUQSzpbYrbaMcPVFjINcHgs2MtZyvBYI6ipV+E3Bt7/GE8DHO8FmmFZpAw+sUzV0qt4mrJsIq7cDGC+LOOGEWU8DeTQC9J+DF+Xyg04xidcVEDQX0KqIz4YyUGA7uiVDY+tFEA5hqtecL3DYgMrbHwzpnGLMRjlFPz1+GVVrVbywhWAFugbO/7C8g27N96Auvn6xTq/MK5fVni3A+Z+cl5mLUIlyPquL/DzYdI43o4RBOLfs6+F2X3QAUyLMw1AYSijfG9XW205mQc5GJFI1mMd1Cj8MdCbfOYCVIcTuxvt+kxRB7+4MHQqbKANyX2pU2vRwrXuUNTdo6EL25A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(7416002)(9686003)(6506007)(5660300002)(2906002)(6666004)(186003)(26005)(6512007)(83380400001)(53546011)(85182001)(54906003)(508600001)(38100700002)(66476007)(6916009)(316002)(6486002)(82960400001)(8676002)(86362001)(4326008)(8936002)(66946007)(66556008)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNLaXRxc1g3dGJZMmRXbnZRYUtOUjVOUlBsVjdQb0RSWWNmb25wc1d4RHY5?=
 =?utf-8?B?RHlDMElraUlLd3Y0ZENrKzY1aHFaM2FUbVNsckpPWnZyMGxlendNNGJyVng0?=
 =?utf-8?B?ZWtxVUZ5QWhoVml1enpKd2Nub1ZxbVlTMzRpT3p3dnhjKzRYUmZlSEFsYUkr?=
 =?utf-8?B?Yk1xN20xSm00UHNHWTRudlJzSVdWekZJMWYyRUc1VU9lM1hNMy9kNFY2c0Q2?=
 =?utf-8?B?RktzWFJOZGFaRkhaK0RhZmlvZkcxdG1LdmVabC8wTzFIWFpnRCswVFltM21R?=
 =?utf-8?B?dURMcjNiUi8wcGdVWEFOcGhKYXZzZVdOVTBLZURtdUJRTkJHMjdXTjNPRkF0?=
 =?utf-8?B?YW9UZ2VmNUh5S2d0R0JhNzNyaVYya1hwbU5NOWtGZ3hqWnc5MHBQM08zaFFG?=
 =?utf-8?B?ZWpqbDZ3ZEhFSTdrLytIZWtNV0lsRFRQK3UrUXkrbituWmhMYnYrZzgremdP?=
 =?utf-8?B?QW9nTTdaSExiWWxDanR4K21sajBwem9PM3liMHJvdUVMNm9BWm00TDNLQysw?=
 =?utf-8?B?RjlkZC9OdWtSdUVqVld5UzVKUnRQZW1DdnVaa25SQXJnYzFKQXNNdUMvUy9i?=
 =?utf-8?B?TU5kclhINmpPa1BWY0hYbkw4Wk9jMWMvVUFGOTdvUm0vV0U4eUNMa1dCWW5t?=
 =?utf-8?B?eWpaWGxJTDRlNnRtNTNUcWhJTENSQmN4MncyRGdWZzZYYXFXMERKeGc5R2JZ?=
 =?utf-8?B?NjVra3BFWXMwcTdUMmZETnk2UUw3MjVuaTlMYXpLbVNXM0l3Ukhqei9nUndG?=
 =?utf-8?B?aW1wOUJsSjY2a2tGamJCSVhGYkVmSU9oeStLSUhCenBPb1dDVkFxNkNwcHRq?=
 =?utf-8?B?Q0FmeFVjMUR0SzdkZ2ZaV1ZIOWI5RGlyMjF4R0ZtdmNyWTZyWnJFM1AxZmxG?=
 =?utf-8?B?NjRKcDJpVUovQkJad2RoSTJBVFpaM29zRENOUzUxS1ZIR2VEM0w4OTFRWXQr?=
 =?utf-8?B?Tmd5WVVhUGtVdi9raHExQjlOZjFDVDFaUE9DdVFHVXZISUhXVzQ3b1RIb210?=
 =?utf-8?B?ZHNKaFltRE5SWVV0Ym9rSUFhRnhBR3lVUzdYR3FZSWQ5ZEZvWnBYaHNlTmVy?=
 =?utf-8?B?VXdGcDhmb2pXbHVFUFQ5VTRERGdic0grRDNoL3hsWmM0UHVTVTdpT2FHd1Fq?=
 =?utf-8?B?eGk0dEoyTVdaMnZxcnl0Wk83ZTZhTzF2alEweG5qbENMSzRaeFA4aFh2UXp6?=
 =?utf-8?B?VWFzMDU1VkVDV25hejJlbS9XZkwvN3Vtdy80SkdWNEZSZzE2MXJBNi9qc2F3?=
 =?utf-8?B?SmEwaGg3dDlrRkpobjhsbTJuVXVvSGM0SHN5ZkRwMXVxejNCWDAxTU0xQjZE?=
 =?utf-8?B?ZHdpdVVIK29mQUE3cWUxRE04Nzh6YjJGaFdSK1F2NWRsWCtPWHluRkgxS1hM?=
 =?utf-8?B?ZmFsdTlaSTFvbVdLdHVSWHdIWDdVS2tPcVRYWnNVZ1hrdTRrY29xeE9PS1do?=
 =?utf-8?B?a2dOeTA4N1E3QTY0QmladWJ6MmR6MkNHRk9NRlM1N2hZajV4eEVyNm9sSGVq?=
 =?utf-8?B?dnBRcktQb3p0YUE4NUdyUHpYQVVIeUMvT0RrV21BVDhmcDJvUlViQWIyazZp?=
 =?utf-8?B?dlZBMzhqNDBJeThsaUN1R0w5K2ZGU28vbWR4b01YK0k3SWxYM0JlNkNhZ1NO?=
 =?utf-8?B?QVBmQVpJZm5zSzN1WFJ5TVhPQWtiQ3U4dm1zTlVPZ3pHaXUxQjJhT1NUQXRI?=
 =?utf-8?B?VENSQlgzUVNCMitvMWRrNmw4dWJkRnFnd1JYV2tBd2s3d3c1Uko3VXQ4VGh4?=
 =?utf-8?B?dVRsODM3M1AvMjJSWlVXd2dvMUpzZkxtZVJGbDZwalNCNkd4bjJIdWpwZXVi?=
 =?utf-8?B?d21JUnU0bktPK05NT1lBVFp5OFI1NXJkVEVTcFIyODk4WFhXZXgrZ09hTmVY?=
 =?utf-8?B?L1UrV2d4RHFsL1VqV24wM1pCWTRGK2xQM1M1SklYamxXQXBhY01iY0IxSFRY?=
 =?utf-8?B?RkMwTVFWQU41RUYwZWtOKy9NbmlDZVNpNXlzak9DeTd0S3cvZXhDTW1pWkRh?=
 =?utf-8?B?ZWpnS25yY28zdTMwdXZ0Zzl6ZU5KRUppNG1vY2JPQkVSL1Mwck9kVFFKTHkz?=
 =?utf-8?B?Qjc5bjg0Zis1MzJwNTduanE0NytWMnV4TlBKMWtkODlPY1FXWE9NRzFBZlBt?=
 =?utf-8?B?cXhxT1FkOXcyNG1vRHhwcXVHQ2IwdjVlQ3AybEowWEYwb0JqYlR4ZGIyeW9Y?=
 =?utf-8?Q?ltOdCyK6ebZ+aopKr8X92xo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d90df5-6dac-46df-445d-08d9e71e48f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:05:51.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6eaF2OTaIRuPK371pOpJS0q7ereC6eZXa2bz45m06ji0gSISAQU0XLCpplTx3b/LHDGyPgLmgIw8xSD61SQdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4645
X-OriginatorOrg: citrix.com

On Thu, Feb 03, 2022 at 01:30:26PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 03.02.22 14:54, Jan Beulich wrote:
> > On 03.02.2022 13:45, Oleksandr Andrushchenko wrote:
> >>>> Also memory decoding needs to be initially disabled when used by
> >>>> guests, in order to prevent the BAR being placed on top of a RAM
> >>>> region. The guest physmap will be different from the host one, so it's
> >>>> possible for BARs to end up placed on top of RAM regions initially
> >>>> until the firmware or OS places them at a suitable address.
> >>> Agree, memory decoding must be disabled
> >> Isn't it already achieved by the toolstack resetting the PCI device
> >> while assigning  it to a guest?
> > Iirc the tool stack would reset a device only after getting it back from
> > a DomU. When coming straight from Dom0 or DomIO, no reset would be
> > performed. Furthermore, (again iirc) there are cases where there's no
> > known (standard) way to reset a device. Assigning such to a guest when
> > it previously was owned by another one is risky (and hence needs an
> > admin knowing what they're doing), but may be acceptable in particular
> > when e.g. simply rebooting a guest.
> >
> > IOW - I don't think you can rely on the bit being in a particular state.
> So, you mean something like:
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 7695158e6445..9ebd57472da8 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -808,6 +808,14 @@ static int init_bars(struct pci_dev *pdev)
>               return rc;
>       }
> 
> +    /*
> +     * Memory decoding needs to be initially disabled when used by
> +     * guests, in order to prevent the BAR being placed on top of a RAM
> +     * region.
> +     */
> +    if ( !is_hwdom )
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);

Memory decoding is already disabled here, so you just need to avoid
enabling it, for example:

    /*
     * Memory decoding needs to be initially disabled when used by
     * guests, in order to prevent the BARs being mapped at gfn 0 by
     * default.
     */
    if ( !is_hwdom )
        cmd &= ~PCI_COMMAND_MEMORY;

>       return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;

This is important here because guest_reg won't be set (ie: will be set
to 0) so if for some reason memory decoding was enabled you would end
up with BARs mappings overlapping at gfn 0.

Thanks, Roger.

