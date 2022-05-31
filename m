Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEDE5393C5
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 17:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339772.564682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3bu-0005PP-3W; Tue, 31 May 2022 15:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339772.564682; Tue, 31 May 2022 15:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3bu-0005LX-0Q; Tue, 31 May 2022 15:16:42 +0000
Received: by outflank-mailman (input) for mailman id 339772;
 Tue, 31 May 2022 15:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw3bs-0005LR-5r
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 15:16:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aab39833-e0f4-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 17:16:38 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-TgkxTEMBOWuYIENMfnSkNg-1; Tue, 31 May 2022 17:16:31 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4819.eurprd04.prod.outlook.com (2603:10a6:208:cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 15:16:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 15:16:13 +0000
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
X-Inumbo-ID: aab39833-e0f4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654010198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVMchtsxbO9suTZf/GVqqb/ifq0kA61qKm6O6h9u8dI=;
	b=HcJ8ypcjisRGCPOx7GUnxHPlZRLJJMoT738bcZp5/XUC0RqwGsoRjgid2Ef/Rca9+6fvcX
	gtXPWYo/ofNB8XhbALj81Fv/97bOJj86wxyNlXvPv5Ox2eatuPg4slfsyQpiWhQlCgxhlO
	AuSPdASHFZDNLiMoIsolmJ+DhFXS2UQ=
X-MC-Unique: TgkxTEMBOWuYIENMfnSkNg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmkC66iq/dOa2+/U6CDdIu1SYMgexExooMDPioSLNdGcLpnaXnLoAD9jODdQpvfYtb0ERr5pbAMk+NKjwMETxCjblHP/8UblHOtuvDcnmzovFyqbFR4aujEgRtgxqxBmsN9uM6IXkM8xxesp/Xmh5pP+E4BcdYo07XiXKlC7jnqxqJLRdatVRJQBPEbi/AsXedt0XadZyi75sl4XwCzHuBgQ+otVROySPywCuwh5MPT3m+9aZbv/B8/zDnZNsCKdGD+e+M1AiVm/EDhvpyIJ+DG+Smj1wfEsI8eleVMPTW3VBEag+yTwgpK+K1oF4xhqUkUakEBheUy0kMDysl4ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGNsVT/2X3jfLFHWXSIrC98CabJV1aAOdssUcDVOrsE=;
 b=E84qTX0MhTnI9yek4nTKdIr1Wfeno77DwqxrWqOfyRZptF0h4urm5F5qgReKAFceo+itipRsP6z+y17PqSElO9Y5sgwtdB0eqopwioX69PrOQw1pdkXiJgTFHTpQOplzYb/0hxPpaXQ3SIvZQAiHgf8e5TxqdkjoHAkxwMWKwdAoErhoQMVqS1U/ldETbMLPiH5Vf8oIHHL12IR7Em47GjBAhGwFYFJsqhspAtBt30YckGW3VSRPUyxyFMUJZasZU79FFL3DXr1oJ2tFkAzVrG6QwqELQftCsg9hTJFx1QgzrA7N9S978lb6XCsNSm5Ivc+LNRZMvKThxIIIMY1YHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73072b2b-0cb8-6a7e-04fe-11dd2085e9ad@suse.com>
Date: Tue, 31 May 2022 17:16:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531145646.10062-1-dpsmith@apertussolutions.com>
 <20220531145646.10062-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531145646.10062-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0017.eurprd03.prod.outlook.com
 (2603:10a6:206:14::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da885849-075a-40bf-699a-08da43187fe2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4819:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB48193144989F9342410F39E5B3DC9@AM0PR04MB4819.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QyJZQAA0WlMoI48iCRsx17SRTp+lxk9zPBO9z2ptAQXXxW302I8JhSaO5AWN4arpHcj0PoDsDAfoCbopGIV26G+f1p4Y2N9G9OE/pvv/Y3oOluI9nnLoc6zJ62q+TWcmCMqGZAeQsSba1ZFb95kt3E1sw6Ew83W8V/LmaThA3Ym3U8FncsHya9k3wR4XWir9ADiYQlQA+ZcQd3JikucxUoIIOrstMxlvGHgWTVZlk5J78I8BLIxg1+/nN35PbmXXUkRujdgc6h61ityv8ajZmT+drBKbx+NhY0b+XyKJoEtwjHPiAk/oxjxn4+oUBNo2pZ8xD+5lrsxQnkd0MP9BewBf+z2XH7C+EVUfG0Pwe0oDIYIDE924VaEdIGac/C3KwCY/8d2Yf7tF9s9PerQc6kVufi5Ry8JkmkcX3DTXSPYVBgNtD0rfxAqoTeDXKOpmkDEq4EN2j9cHzXJPG/Ou4VA5LcpuYCjfXSBdO47fwRoszR4b0jnm7fY0cPHdWNu5dcp5J4G/fQNenUi0RaIE+hyGgOwyKSsq3u+4lBTnia/pim3aB/jEXorfyc833/C19Ja52Z0rAHhouWrjPUDNQwG96GSDa0wrucBOTLkPi3fO/QLkcjltqBiNw0GERQ7zY//OzCHZYsjgVNeHWwpJK7Bh0W4Sv1537bIY7veLxAp+N+bCkhluOk361tm3rhjfmGUs7dEWswfXxVKkRWpoR9oZajaWxXmwbsfDsS+7jKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(4326008)(66946007)(6506007)(38100700002)(2616005)(31686004)(66476007)(26005)(66556008)(6512007)(2906002)(36756003)(8936002)(508600001)(6486002)(54906003)(31696002)(5660300002)(86362001)(186003)(83380400001)(53546011)(316002)(7416002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n4ftJMRur8vpgYWODK9CFDMbu1PUj1eYHxZP4f5BPprRLcK+5blP6I+7j6l0?=
 =?us-ascii?Q?gWkGYrYlKOpOTySSZBGKlpKBWBYLATIUy0xJekoNRqY9Dz0fZ0qZP1uKpssE?=
 =?us-ascii?Q?K7kONOO2iRgbazHcRmfWBc6pC77OwZwhaIFnsUByMKwoPNhBjPULUXRGXyjA?=
 =?us-ascii?Q?mImMilSJMWHQQromLblt8Fo6WIRUbfZFHFhehx/AGNatQIPOiDzfFFeFzTtN?=
 =?us-ascii?Q?MRWF2gViWO7U7UDxQFYwzLbleS0pa5lAc8xMUuMON03BvYp1N818yEzUlmD7?=
 =?us-ascii?Q?EWuUX+cfWvJ9d/c+fyvpVx8uonVr02VtZg5jxZI2kalFlZ341YcFlbbZxWiA?=
 =?us-ascii?Q?XfxdS/x5dbgACrpQAl53goRDaKrvE1/vtotzfLzqWfnaBB6HldL7yRG8U2IX?=
 =?us-ascii?Q?j6ARAXz2kTv5eE8xjUEuDlcogRugtxt31nr2z5Nn9eQhOo2MlJqE0ELhpvMC?=
 =?us-ascii?Q?MvPECDXgE5LDi57ZXtViv0wwRi5F3vgUwGvyKsvxMaj4ElZAh5Ex8T+HxS9a?=
 =?us-ascii?Q?YxvMwoORqm9stOc8CAn9PZO/LrQh1ZJoRACzJ4bpT9gkysoY4ccP+EvZYM1l?=
 =?us-ascii?Q?riJQ0/8Meo+rv+bQbdAaeyjDAE9qzXCWsTcRRp5B0Fnj8IwIwiOw7IGoYLnK?=
 =?us-ascii?Q?hHmqoas/ntY3/nTpYy15oAAW48MPhpGKCKDaJ2F4DPurF0hsVrRjL0qxu+Ty?=
 =?us-ascii?Q?/X0s/E59doUvCg7e1TurnWRfAQQCjm3SaMq7IcqtvS3C/dco4PSollchIVio?=
 =?us-ascii?Q?ZntXhyqGzaOdSGQE2TXVRzmUVSq3+5+mR+JvNS5meGDMelfLjN0+6uU2nf6l?=
 =?us-ascii?Q?j9O/vM4ykmUhSREBQchDG0aDqx/5uodcYkTcHr7cXNm97Nyy9b4xx0UwStta?=
 =?us-ascii?Q?oQgXMscXxBkpYOv5vKlRQQkqq7Raj9k9hTNTkQUgihS5fOg0L3bWU5ZsfzJU?=
 =?us-ascii?Q?/bBn6p/c5JLMZOVrJk0pjwOIyaFWPz18m8VXEbJvVJBluUEe9kp8c0qAvban?=
 =?us-ascii?Q?9qxyVQRdD1ZQSENNg9EzwDjOGEduyXSDBj0mMhlqbjEP8vEgsRevryZnVBvk?=
 =?us-ascii?Q?NRF2eA3e6OC4UkEyV3aCY0F1fZAHF1Jgglc8d4JyuOIJUqfyOZlGPVh4p4gb?=
 =?us-ascii?Q?lH8hQoKclPY6HnYSm+T9v/PBV9qXDnen2WpJEtH12yNLFUDoqb4q2fgoRpnw?=
 =?us-ascii?Q?a7eLmT+B7DISW0JM14P64uIFO3UmEbFk04+qUT3XQksgxhFYgwvHd71blBTH?=
 =?us-ascii?Q?fLjwtW6LlzYSYXvMojuEnDcs/D5chN4ms3v3kmKKw3mWZm0qC+HsCHljsI0F?=
 =?us-ascii?Q?zGODYxrfxycev9F5sScbeo7h8/sB4XoiVXn8qeyEtyomTjCIV08Y6T0q0GjT?=
 =?us-ascii?Q?omhlv+ZdE8PtO2z/lajlfRrUOGD753J0d6pfrtO/wOgW4qFG4YhlDkg3UijS?=
 =?us-ascii?Q?U4nTlkhBACeeDQLR6rPIjhG4zA+Zen95rO9GzsPk+y2GhHdJ82fJsUI8kvJl?=
 =?us-ascii?Q?Qvm73qSQAwM6m4VMLyywSrXGCjc/inCmfhwVVavWqWfE92R/9LbFEErIpKOZ?=
 =?us-ascii?Q?Mg79eTiYtoCodUd03wLVAn2QNiGWD7hkNFhzahJtmnevIsCW+G12/W6Ej3L8?=
 =?us-ascii?Q?9yRdwo7DyhEhEqqKcIpDogHdyP83rRZ4pw+DgT8yoc5gcNtqOBfAgchMdBgP?=
 =?us-ascii?Q?/vU9lGFBiv4GzxX98xspUi1qpDilFfAgjLjUGhMn26lW+YQpyCxe0ed3cjAt?=
 =?us-ascii?Q?uZavLXpDeA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da885849-075a-40bf-699a-08da43187fe2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:16:13.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HM5hTswjfywejGHye8pmyIWa8tjMDr9q+62AlypFo2SkmYjCSqDLHnzmH2oA4nmRbhSV/hxZxucSMtdMPrPOoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4819

On 31.05.2022 16:56, Daniel P. Smith wrote:
> There are new capabilities, dom0less and hyperlaunch, that introduce inte=
rnal
> hypervisor logic, which needs to make resource allocation calls that are
> protected by XSM access checks. The need for these resource allocations a=
re
> necessary for dom0less and hyperlaunch when they are constructing the ini=
tial
> domain(s). =C2=A0This creates an issue as a subset of the hypervisor code=
 is
> executed under a system domain, the idle domain, that is represented by a
> per-CPU non-privileged struct domain. To enable these new capabilities to
> function correctly but in a controlled manner, this commit changes the id=
le
> system domain to be created as a privileged domain under the default poli=
cy and
> demoted before transitioning to running. A new XSM hook,
> xsm_set_system_active(), is introduced to allow each XSM policy type to d=
emote
> the idle domain appropriately for that policy type. In the case of SILO, =
it
> inherits the default policy's hook for xsm_set_system_active().
>=20
> For flask, a stub is added to ensure that flask policy system will functi=
on
> correctly with this patch until flask is extended with support for starti=
ng the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active().
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com> # arm

Hmm, here and on patch 2 you've lost Rahul's R-b and T-b, afaict.

Jan


