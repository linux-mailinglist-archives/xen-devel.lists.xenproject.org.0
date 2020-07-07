Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF4217895
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 22:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsttF-0002Nx-GW; Tue, 07 Jul 2020 20:08:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMg+=AS=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jsttD-0002Ns-39
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 20:08:27 +0000
X-Inumbo-ID: 9c1b19ae-c08d-11ea-b7bb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::71c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c1b19ae-c08d-11ea-b7bb-bc764e2007e4;
 Tue, 07 Jul 2020 20:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiDrAuSpVmz6ZLc4y1YU5F0PypfliKCbPMiN4V2i7DJjHWGhVLGnK/pPFk8rrYPWJFZQ71eQ/BiXQCV75NVJjNwYj+IofTHQ1dKRkcAf6NLeIjotX/bJAIE5OuL+5WIr9fBEQ7ZGLYLzqS2BQb845BvfLgSSsiCFK9M0XpUhmb8kGq3G0L5WDhLemrm/LHfcTjxtmwZZWCxp6ig3sK0aSCmelUU5Gp9jDjEK1goPKZY28Ue38J9twrBVhpmiem203eL5Wc2yygIamDCclcYYQDpqlLwPv4wAUzilAmDhbi4NmXET9my2EqII3t8Mm5uT3ZTVTX76oXObP7BQ41GoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Y0d7pH2Kl9fMsIHQ/bgSh645mak3V/leis4tLusQVY=;
 b=E46U6tQ3uSgPrSa4gK1Jd+Xr7rsqx0rA1uxiz5nwbghMEbOaDKdIxg2tbETJeeMueHXCrfbBoeXhmLN2Z0ZOF89PvOLt/SlzbVBsbJVnIwn9x/UkwUc+Sz2qjPol3OZdft2PCWxQnvGW51/fSYIX+twv5yv1H+CK1SruGpSrxGd8WBPmKKSdlOlCewYCuAiM3QUz79NH/hED/Uk2BGLU4UilE3WT2YJyqjLDK/zabhQZlKXaR9zqPopdNv1PDI0VHk4Xmym7AITY4jpQghxQ6Dcq0ghL0h6RBEhl9DM8316fGAdGqioorCUnUw0356azpqtUjYEZ0qPxmoG3t7ioig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Y0d7pH2Kl9fMsIHQ/bgSh645mak3V/leis4tLusQVY=;
 b=AiWrRKB/ymapRzUA3SkdCXG8gK1xpaaVemisZhRwWA+Etz7YnkCLsItS5BINixKRGTXm/0QLWx1/u/XHGdNjL7nPYOlGvnYdO7VynjQ7r0x+/Qhr3Zmw3lmJaMwiKQGkQc+eh0zjDMpUhFb4kWJVYhdAOYdL7urjCWeL68eGGyc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Tue, 7 Jul
 2020 20:08:21 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2c53:d56b:77ba:8aac]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2c53:d56b:77ba:8aac%5]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 20:08:21 +0000
Subject: Re: [PATCH v12 1/8] error: New macro ERRP_AUTO_PROPAGATE()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200707165037.1026246-1-armbru@redhat.com>
 <20200707165037.1026246-2-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3bea211a-4522-f713-2edc-261730702114@virtuozzo.com>
Date: Tue, 7 Jul 2020 23:08:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200707165037.1026246-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:205::42)
 To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.58) by
 AM4PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:205::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23 via Frontend Transport; Tue, 7 Jul 2020 20:08:20 +0000
X-Originating-IP: [185.215.60.58]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a20f82af-f381-4aa1-0deb-08d822b17f72
X-MS-TrafficTypeDiagnostic: VI1PR08MB5503:
X-Microsoft-Antispam-PRVS: <VI1PR08MB5503F80F03A35A8E5733A751C1660@VI1PR08MB5503.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYngkoqd/Gcc6Scb0LbJnul6tlc1SNUaRKuqWTOGynR3oLNL74Go/4FHpxHMnWI9LX3EO8ryUt2qn1g48ITW0TesFK3k0mpYKr1FKebHwXiiF7a/QKqFsatRPTOyGBwDacvRU79wVkQucXManN4OMwrAvllRvplCYnoHcsEcscEfFYCs6lUxgdJv/q9agKjqvgHOdp/sFf6o/HnGyssV7e7Z4u6xhhFNwm2edhMWaKbUn0gBCSoVM4nGrBWAzLR4mAFbVMfuQ7LZdDh2GTcLvWiEPSM6qQp8XLDLQ1iRf8wioxn9gSeKZ6WWywXWKsnDof9sFuC7NgLaLN3x8M+ilQmLRw36ZAq0iwYZg5fze5mVZJeliCI4sItu5USqEw/p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(4326008)(26005)(83380400001)(54906003)(8936002)(31696002)(2616005)(2906002)(16576012)(956004)(86362001)(31686004)(7416002)(5660300002)(6486002)(8676002)(498600001)(36756003)(52116002)(186003)(16526019)(66476007)(66556008)(66946007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: L4GlWqi6r3yNIcr4nKsZgPrT+ycvy+1peDO3JLJXl6eUG6bWnMnKbpvGAFbJYfsrbtKz5vTEwRXFvQSFPZVsRYJq3EGXBbxODAY2Bj2g3BxbnCkEyiRBBSG6fnoSL5z2J+gUsZnCpLL6q9KFN3Jd5qGcu08S5DNDrxb4qhjrW8Nk4ytx6ENGU/PDj7MQ5BCiwc5j46g//f8gvYLeK1BwRpDnurpH2GYfQ9PYk56I6PeNb2cv1nqKTDNSto+CzArUkoJobIPxZrC8B/t5b36iBSQoM9bqi8HZavpCCSFVEpwfP/7aGP63VxNBNq7C2HhjiUyKHfAns0cxSejKB0SO/WDIk+saxVi5mbMA13mInD0CSzxgaz3JBCcUCZ47CQTCbR6G39mRl4iahxnqp/yWKsXCSH//AJlSwZshYIHTL7lhEqFR9GqtIzAxRX3FDVGP+p+AWtW8XES59xKF2SLFvXe1RNCBcH3TsM42COn1Sh8=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20f82af-f381-4aa1-0deb-08d822b17f72
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 20:08:21.7095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPAkjGhAG/5rKuhS9mJwXZH0Mf31nmgHRaWqEtQ9ZY24Q8a7WRMtGxRCrHIWO5Kpin5aiiDeaw7vVsL3KyUvF6bwRJ1wqzv0v7Lqq3M+q/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

07.07.2020 19:50, Markus Armbruster wrote:
> From: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> 
> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
> functions with an errp OUT parameter.
> 
> It has three goals:
> 
> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
> can't see this additional information, because exit() happens in
> error_setg earlier than information is added. [Reported by Greg Kurz]
> 
> 2. Fix issue with error_abort and error_propagate: when we wrap
> error_abort by local_err+error_propagate, the resulting coredump will
> refer to error_propagate and not to the place where error happened.
> (the macro itself doesn't fix the issue, but it allows us to [3.] drop
> the local_err+error_propagate pattern, which will definitely fix the
> issue) [Reported by Kevin Wolf]
> 
> 3. Drop local_err+error_propagate pattern, which is used to workaround
> void functions with errp parameter, when caller wants to know resulting
> status. (Note: actually these functions could be merely updated to
> return int error code).
> 
> To achieve these goals, later patches will add invocations
> of this macro at the start of functions with either use
> error_prepend/error_append_hint (solving 1) or which use
> local_err+error_propagate to check errors, switching those
> functions to use *errp instead (solving 2 and 3).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Reviewed-by: Paul Durrant<paul@xen.org>
> Reviewed-by: Greg Kurz<groug@kaod.org>
> Reviewed-by: Eric Blake<eblake@redhat.com>
> [Comments merged properly with recent commit "error: Document Error
> API usage rules", and edited for clarity.  Put ERRP_AUTO_PROPAGATE()
> before its helpers, and touch up style.  Commit message tweaked.]
> Signed-off-by: Markus Armbruster<armbru@redhat.com>

Ok, I see you have mostly rewritten the big comment and not only in this patch, so, I go and read the whole comment on top of these series.

=================================

    * Pass an existing error to the caller with the message modified:
    *     error_propagate_prepend(errp, err,
    *                             "Could not frobnicate '%s': ", name);
    * This is more concise than
    *     error_propagate(errp, err); // don't do this
    *     error_prepend(errp, "Could not frobnicate '%s': ", name);
    * and works even when @errp is &error_fatal.

- the latter doesn't consider ERRP_AUTO_PROPAGATE: as we know, that ERRP_AUTO_PROPAGATE should be used when we use error_prepend, the latter should look like


ERRP_AUTO_PROPAGATE();
...
error_propagate(errp, err); // don't do this
error_prepend(errp, "Could not frobnicate '%s': ", name);

- and it works even when @errp is &error_fatal, so the error_propagate_prepend now is just a shortcut, not the only correct way.


Still, the text is formally correct as is, and may be improved later.

=================================

    * 2. Replace &err by errp, and err by *errp.  Delete local variable
    *    @err.

- hmm a bit not obvious,, It can be local_err. It can be (in some rare cases) still needed to handle the error locally, not passing to the caller..

may be just something like "Assume local Error *err variable is used to get errors from called functions and than propagated to caller's errp" before paragraph [2.] will help.


    *
    * 3. Delete error_propagate(errp, *errp), replace
    *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...),
    *
    * 4. Ensure @errp is valid at return: when you destroy *errp, set
    *    errp = NULL.

=================================


May be good to add note about ERRP_AUTO_PROPAGATE() into comment above error_append_hint (and error_(v)prepend)).



=================================

   /*
    * Make @errp parameter easier to use regardless of argument value

may be s/argument/its/

    *
    * This macro is for use right at the beginning of a function that
    * takes an Error **errp parameter to pass errors to its caller.  The
    * parameter must be named @errp.
    *
    * It must be used when the function dereferences @errp or passes
    * @errp to error_prepend(), error_vprepend(), or error_append_hint().
    * It is safe to use even when it's not needed, but please avoid
    * cluttering the source with useless code.
    *
    * If @errp is NULL or &error_fatal, rewrite it to point to a local
    * Error variable, which will be automatically propagated to the
    * original @errp on function exit.
    *
    * Note: &error_abort is not rewritten, because that would move the
    * abort from the place where the error is created to the place where
    * it's propagated.
    */

=================================


All these are minor, the documentation is good as is, thank you!

-- 
Best regards,
Vladimir

