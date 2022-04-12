Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4AC4FDF53
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 14:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303638.518041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neFSV-0001vl-Fu; Tue, 12 Apr 2022 12:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303638.518041; Tue, 12 Apr 2022 12:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neFSV-0001tB-C1; Tue, 12 Apr 2022 12:17:23 +0000
Received: by outflank-mailman (input) for mailman id 303638;
 Tue, 12 Apr 2022 12:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neFSU-0001t5-04
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 12:17:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80297aad-ba5a-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 14:17:20 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-5Hsgjue7MTqTeA65cjYT7A-1; Tue, 12 Apr 2022 14:17:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8453.eurprd04.prod.outlook.com (2603:10a6:20b:410::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 12:17:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 12:17:18 +0000
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
X-Inumbo-ID: 80297aad-ba5a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649765840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7iSEzImljEO7PShfpS9/gmeYUd9c05wZhln2dpwd4Y=;
	b=IMVZ3a04QQG589dY10DGWjl4iiqkoSGt8XHNnyJWb6XW92aKGNL2BZO8SEuBl7VO4buFdI
	W/8fZOzkqIsS7tiPkbpd7QiaURXXIyyF6TqQusLfcQBwfhfHbX5EBd6MzdWuaVzj1R+Dtb
	n5zukuM0lSoKIf2DVbtDB2/6vX2MkNk=
X-MC-Unique: 5Hsgjue7MTqTeA65cjYT7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k84pVLPmP1E1Is+tFPCtAdWH9m86B/RQToi+ZEIcuozsCQNhdan5ycNUcFRhBd9giO4vPn4yQZ0pDnOB+EZ3XD5n2sQcKdUDiEfY7+GoocHRgt+FP75LtDyPLXnrEGoFtpl7KTA5wqjpQ9xLRbYR1hPvNyz3jYHSM7/wvru5lg9rsTxPZ/WAA7pbhbQ8Jm3IEBmniD/8ySD00EouhAILDUxWYXPJlewLd4az2hlh7zHQHF3N66bS1WrWRpsjAF2QBLUoBhg06XBExkyRONkDzoZWmCrQTiXlV8VVYlrue6wGtRYE4Y8dmY0N91Yp2tUMsbbqdSPjZJE/HhYE4fy08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0bbBtWWSE9c+Jrhd3uPxpdOIXBy9jgJsEvB3lTQxl8=;
 b=Ez5psYSacCmjgrffmy6KDyi/ejbiitsppTvFFx3Mu+uS1J8sNR+OtpOqOcxb6hyZQ2yCYB/Sc0ONMeFYwWZxChgZd6e+SXxFxbepUekzWRLsxIFC7suizpKBq8mfqcB7jCB12j/ZpbOxRWNLQmyVxvE7nQ/dujTBvsAmKAg0fApPBZQs52TwEifekN2xte4C+uLeOmbMtwKbA9nt9AlBQikxcjS0eI91JQ/1Hj7vvTtzJc6wIjIRit65l/5ksaWhRVadwhDGELhqYErhVgNnfSb/q0dbvyGYBDiEvsXyAjGkhJfa+fVZ0Lw1FJvcJ0Vx14cbebfLDVNFKbdurwuT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c09c09c-01b5-c020-5a8e-c0453e3b8fbe@suse.com>
Date: Tue, 12 Apr 2022 14:17:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
 <YlVc9shnBYKShLiP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlVc9shnBYKShLiP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::42) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce873fd-1547-47d6-703c-08da1c7e6315
X-MS-TrafficTypeDiagnostic: AM9PR04MB8453:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8453C068C87B1A73B849AFB2B3ED9@AM9PR04MB8453.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bj2/WXVKi6tOpQ/bEuonkcYpidnXlZnmujzyTw4+GM4soGVLnU1r85zf2ODoMLWuypFsollbfT/o9iR49WlOz4QdnzHx0ydxbqWGlkEu8CDpoYhPKI62Tiv+zw/b8VtvL5Z5rrcYaIZZ8NLzaUPIE93beS7sFEwiDH66w3yyF26pXBTCzFRJmyxS2Uy99/CJBKRr8h1I27Zx0To39ZgCfWRYbshxy5S/migBNu35yq1ZF6Ngqz7RCUUoDdKP75wVlQjbebnF5ab4js6NasH0D4B4KEZ2zQ7+37121aqgJU33IMxsq31nlAVqt2XXD6eIHcG5vAjpQ2GLzhRldFJxTO1crKQCtjdj/R51P54+h8vfh7Uq6hBTKYVGQeMfaCsophg5ptFWrYzyWgUiEVSToV0yMfdOPVWePMUk9Lhs6VPxB6a8c+u/CefJVX0f9ezqe7CZdHcAfZD2F3xn2ygzolvpS30u8KoMZW6Wx9AYxDdFqAwOx3Ruxcnge/EkdgRlpf2fzeLGdTDwpGrcdcYHAWN1UYKPlZEGh+7NmN4BJ825l5M0zX9F3rlAPl37Rd+W5VcMaBOYYS1343q5lZxW4Je1O8SZFS+6Ke7mxvwuy9g5DlP2cYiTpBpB72szLZW5/BBdYz4UNYDYXy/KTqPZLrNg+ll0EZND5bDHABQUnl4fQJ3bXP3KIqb/8YsInz+P1GG9rmf8lzgzvgV8w0WFZy+W8B/ukNzrPg/YbQOqkD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(186003)(2616005)(86362001)(31696002)(26005)(8676002)(508600001)(316002)(6486002)(6506007)(6512007)(53546011)(38100700002)(83380400001)(8936002)(2906002)(31686004)(66556008)(36756003)(4326008)(5660300002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W2v75f5/0NZNSeZNX/wM/v9ShU0IUBBhex1Cs+8C02dXvdIeGenigPVVzQfK?=
 =?us-ascii?Q?LAdZO/IXXFo0cXRKDd5OcMqfZRps+XcamZgHaFaIyxgfZDzXTeDh2Fa3ErLC?=
 =?us-ascii?Q?p4V7YoBeXQ13/wE1f8SF6CuQaHU8zpX6HWG3jFEFdFlMD7DRkvIZJaN89qpq?=
 =?us-ascii?Q?1TIv9e8XSQBae9iJlVbpCyHzniAzDBaIVfWBKj0NwGZBYfu59gIjWEmIa0FA?=
 =?us-ascii?Q?YnUi8SNAYkb4dGLy6UtCxIXrhPHwl0XqccDgzWBPxJynTSvSIlb4OTJ+OfDD?=
 =?us-ascii?Q?hVn9+GQoDNF800MiNbOHgbg9UvdbP/hcXPrVF82XWto1kXNx2VI22kRilj/B?=
 =?us-ascii?Q?DGfUqwhUWNOgcXGGAQkkF/TfwBwFBS0UjVuQcY/qs2AX1/BwW254zJLEQrDq?=
 =?us-ascii?Q?VC7065haQOxbi2oTn6Tz5wHicSr0jKJmiS2JBX1tKodWAqHD1jzxj8xWW3GV?=
 =?us-ascii?Q?/GmK2GYSq4+xjSO9FBj7TsZnL8nqIitMNvhnMyRcsj1voaSntAIp8orQ0kAA?=
 =?us-ascii?Q?MkfoC5mEeNCBalGCwjSq7/YqEPScD6q4Nobn4QMb3AcBR05fzQ1f350XpDx0?=
 =?us-ascii?Q?nbBkZYtwuP3ktaRd2npVyOUGvg4NDre/IGP+JAusw4KI9nyOZhAZHBVR5hjb?=
 =?us-ascii?Q?7MifrAxZJmFrkAolMa5Hkol/Ftc4vKlNugYXecltNL5hBpjpmZovTzVLCmEb?=
 =?us-ascii?Q?FWyrQT83/Q5chiHHGvtjGDdZG78SdVmqNgpwV24Dw/SJZCVqXlgPMDb/IE4Y?=
 =?us-ascii?Q?0jVhlWgMAgr+BUUHGsM35JxSrMBGe7xEfsqNGMvJRnb/UCkTTxzVVlUhEmIE?=
 =?us-ascii?Q?nEm7OP4x0hRSCZXub3CUHdygb/EiFonA5vqDFNVrKYz6ro5m519gDX+k15/w?=
 =?us-ascii?Q?E2qj0mYDfkQjlC/r2y5hoXBbrYxn/8hRPNvZAOu3J61kUyXh/JhGUIBCufET?=
 =?us-ascii?Q?04dM+82ZHmY+suZtG5+0XdrH80R8FlwANNR9yX91P7KirE+6fYRATk1fhUZ/?=
 =?us-ascii?Q?TCoocpBHj8RKyiK9Cfw5RoQn90b1KC9a2RLjg419o237GRBel1boah1LYvGG?=
 =?us-ascii?Q?ZZjZfBpIB8/oCVrDxNmORa39YYSkYgCWDV8UlPe3Eda77IAbw6Aq17GbG5oy?=
 =?us-ascii?Q?DX3/D4oiJWmS8mY/KSIgbVMew2hcDZOZkPOqP+Acx4774aFiUIkW40bZO76A?=
 =?us-ascii?Q?RTrM4lb81MNK9DAu6GOw32ki4mGPOK1FTRjlLzVlsgmTVLoAVA7sdMkPJmF+?=
 =?us-ascii?Q?bTfuCB4gqEMZSHkeCWxLTCebcisOyZ64fFdTFc7HHUEaVHhQFlnqlkKxBInU?=
 =?us-ascii?Q?+nHHAuqi+Pp4OJEkvFzs7p9aDnxV0zxdiu1gfly9Ptx8hHWbKIyNGtwymST2?=
 =?us-ascii?Q?f1qSZkzJgGrmi1ZSSwK6hEm8U8Tgev5VDXfr/ef+hs+PHVaxAj0SfLuGCRZN?=
 =?us-ascii?Q?Fic4jH9dx6lXBfsvakf7DyTNhiIEaQAPpk8HkKZ7mgPywXjobjlw1CbUSblB?=
 =?us-ascii?Q?jyf4ogeBiMKHzhxWZTtVlwcqyvU5t3M2Mb1YgfV9Ym49IDBqzmXPAcPpmnqT?=
 =?us-ascii?Q?bDd8m5W7iceHxWrneWRQS+VV6Qcf2ocHQ3gjIioR3hixliMpx81VtiQlAdbB?=
 =?us-ascii?Q?oFsKXZGUXlAJdvK9RpvfRcvydL5Qur+NEpWDl3w0Omx9o3qEt+eq8ziINgIO?=
 =?us-ascii?Q?ZBd6JPaIKweQ3/lYU6ntkHjtNRYhLlQFZAIBs3xzQTsT7TRVohc4iwCSpsWV?=
 =?us-ascii?Q?+M9fKVI9Qg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce873fd-1547-47d6-703c-08da1c7e6315
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 12:17:18.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82ZC7qAOgzg8oMAKrXB3TrJGj/DAmI4k/1dYtMduzHpv90bs4lmLwyYvWAyriK5kIvjHc56CfH+6MNGp1RjFag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8453

On 12.04.2022 13:05, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 11, 2022 at 11:35:54AM +0200, Jan Beulich wrote:
>> Prior extension of these functions to enable per-device quarantine page
>> tables already didn't add more locking there, but merely left in place
>> what had been there before. But really locking is unnecessary here:
>> We're running with pcidevs_lock held (i.e. multiple invocations of the
>> same function [or their teardown equivalents] are impossible, and hence
>> there are no "local" races), while all consuming of the data being
>> populated here can't race anyway due to happening sequentially
>> afterwards. See also the comment in struct arch_pci_dev.
>=20
> I would explicitly say that none of the code in the locked region
> touches any data in the domain_iommu struct, so taking the
> mapping_lock is unneeded.

But that would limit what the mapping_lock protects more than it actually
does: The entire page tables hanging off of the root table are also
protected by that lock. It's just that for a pdev, after having
installed identity mappings, the root doesn't hang off of hd. But in
principle - i.e. if the per-device mappings weren't static once created -
the lock would be the one to hold whenever any of these page tables was
modified.

> Long term we might wish to implemented a per-device lock that could be
> used here, instead of relying on the pcidevs lock.

Well, I would want to avoid this unless a need arises to not hold the
pcidevs lock here. Or, of course, if a need arose to dynamically alter
these page tables.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

Jan


