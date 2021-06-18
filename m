Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8953ACC25
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144644.266207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEWS-0002BS-3m; Fri, 18 Jun 2021 13:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144644.266207; Fri, 18 Jun 2021 13:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEWR-00028F-Vt; Fri, 18 Jun 2021 13:26:59 +0000
Received: by outflank-mailman (input) for mailman id 144644;
 Fri, 18 Jun 2021 13:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luEWQ-000289-H1
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:26:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 227dcfdc-82bc-46b5-b0d9-90c9e266bfee;
 Fri, 18 Jun 2021 13:26:57 +0000 (UTC)
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
X-Inumbo-ID: 227dcfdc-82bc-46b5-b0d9-90c9e266bfee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624022817;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IMuQilzr99wAiIcEeWK1T2Gbu8saI/qjJKN0Nonk28E=;
  b=g/9OFiGhu1zR78KLyqH3EEozvv58OnQCNMGzMzab3/H4ZiFxSv9fr3lc
   8S7fE9zsETXrcaGftiNg+VkEWByrtr2bh9lCXc3ch/8ryPdenoYl0OzOc
   Y8oPZmeJ+1hoTslbJDa2Dm8KjO4BH/MwcYvCut/ThuDFXB6YaEQGaSdy6
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j6zIGKgoC5wELQhSd3IRgb7+tIIhb4NImVFv5l3PBJtDftUtVHeaIcfeiPJjbBRcZRN0l6UmjQ
 KN30zRCJGU0H9WgMg5017HezcDQPivr+FAUHr0zVhnXdTJQgkkTJkVYCKkQBoIASCtPRZMA7wf
 SzSEwTsJYMlpUhYUpVnI7RqC8sU5D5iqfMfEkyRjlUaY57RRv9zSK9bXMVgJ7V+dSkG+w6fofw
 pul4fy1601AGdU9ab6DaNDxc4ar1p6iIQ+/GfH+x75tWqsyg77Ujf//rFeNsoLPVlznHHjWBD0
 ggk=
X-SBRS: 5.1
X-MesageID: 46530052
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ismMFaxZhWRzJWjAF0MpKrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LXHCWuDYq8dKbC8mcjC74eurAYZcegpUdAF0+4QMHfqLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7Ld0XtEtKz6OHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1Qcfhb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86I9Apv/MaTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uPp2Y4m+J7tQ0dbWInUs4UkWUjxjITLH9ZdxiKrrzPUd
 MeTP003cwmNG9zNBvizzBSKLXGZAVAIv+EKnJy8PB9nQImxEyQYiMjtYUid0w7heUAoq9/lq
 /525RT5cVzp/AtHNRA7cc6MIaK4z/2MF7x2Fz7GyWuKEhRAQOyl3ew2sRv2N2X
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46530052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vg5kKB8TOYWN/g8g6kaEEfQHAdELbmMjJlmCZzo5yG7LK5ybN3TXU7pJdm/UTR39m1auOQOx9IB+6jvKiE/uZI2tJnOIW0WaNTGI3nXVg3KY5GOqrYiopQ1/g+npxZ4lRkp/1jwkrYDcZUoHD1j1pa14K43U2XU9nJozGzpfcOpaA8P+A4rDJ4cYeHIwJ7GV4DMSl1A10ic+AKM+PExPhyHnVhjzKLFHz+6B0xfQes5K/MHUjOAuvBMhEbxDGkfo8IrFmFYwtR80M/sQOXB9oYzRbLChq8m1GqG8H04S+xNWjzCpJUa6hc1qRkwGlIGyjVqsz3h+IUwrxmUrGTZQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMuQilzr99wAiIcEeWK1T2Gbu8saI/qjJKN0Nonk28E=;
 b=erYblEKrBto1YDRU0UlGd5qu4tlp+B2Tf+marmoQbWuwXVIm8y9eF17t/iQQP7CHlYcg12S27vysUrYM0pOnGnz5Mq3RsxKZJQUnxOHLiZWCOdgrX8zP38/Y+PXryn/G7nJ4ZkHUPeYOUk6KleNKnDC3zTZA0dxL3X5Zxw+aLTEZHLKeD3kBfQYAzKPPZ2XGf/xym41hDIynUmBjLTtbVaW0ZkLQpBo/wsQs5LhV8yvM0Pgru8F+297a4Cio2cLOhWFsvbWgKHphXn/MO+hXJTNMFEr16/IaKUTdu0Y2S+uiBVCmcDpY2uHvtmG9gCp61/tt9g4bdmXx9jyD0yJ/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMuQilzr99wAiIcEeWK1T2Gbu8saI/qjJKN0Nonk28E=;
 b=VpXzhRQABXiIlWK3SKpa5TXtPS2zQDhQVuFzL+Y9efDk7tzr7xmU3UW00abVxmq46Or2o7frwlm86PKaAXQMWK3590Mf2rDi71sxQal69gitmeik7gS8dCXq3lP9JotLq5i6Ov4c9hkoybZPYAzJx7S3HKC7246qTQ+WdVw26tw=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <798b7eec-e31e-1798-773d-c2865fba4be2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] libxencall: osdep_hypercall() should return long
Message-ID: <a8b032ec-bafa-ef50-825f-26e975e64c69@citrix.com>
Date: Fri, 18 Jun 2021 14:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <798b7eec-e31e-1798-773d-c2865fba4be2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0453.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c3049f-05d7-4176-6516-08d9325cbcde
X-MS-TrafficTypeDiagnostic: BYAPR03MB4679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4679FA6CDE6249921993ADF7BA0D9@BYAPR03MB4679.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8lmRqcfDXxgUQ5JIaVzaulqgd58KsHzKAAO7iE6nWxBVyvWOsA+ypKEJ8bJ5z7SB7UoYqhOvdapLFjXmkt9ZyhdROeDNn/fUGNu951SEFwDLuCeIKh9VUV7M22u3iCd2PYjm518Br3gMsqUShiu5F4+WmDLB/uqzlNd3GGzL4SPIMiN/ugQE1fTkbtoulLLlKGonz3M06dRhcBcp4SwcFxYWFfdUH9HxScrbRK6z1OqxtRot6NWBbWbYe+JtRqKeIOpuHqrWKN8bEzsOqb6l/VTTvHsVhc9pzQKI77UxOf0QEEvyRgttIKuTLVvNgLSRneC9OwLPyJCYUg7kgDSlGsQYqR2nIzxg8gGY9KvvP0DwoQEhnT5Rq1ra27nj6lu/I/M8c3rKlMMGtOV0LDFq9lPJxNDBtA0VsFmh+ysJox95lH+VOKS0OAYt5vxwPaOhtiW0WlRqEzlPJIa3DyINMDk77sn22Ejx4IpOgaEeE8GP+zJcf2reQQYvFRNHV0vye8TAcmVJcmw0pIRZqbTf49FeYpVzTtK4lAu6f9nHloTUvm5gtNxXDecWOyN5LsAh7ORKbvlnRDGykrPJgJtkvwsH4bTNAw/YeB23IJdFv77bKD6rR6sMRLm/NLmgUt6RjzsHusI7EXESfMVBvwm3M+XAkhmsYaQRjzZo4OHByW3bAFpuk0m2VnID0QKt7+fd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(16526019)(86362001)(110136005)(478600001)(6666004)(66946007)(66556008)(66476007)(186003)(2906002)(16576012)(31686004)(8936002)(38100700002)(31696002)(4326008)(5660300002)(4744005)(316002)(54906003)(6486002)(2616005)(956004)(53546011)(83380400001)(26005)(8676002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ZlZjJzQXl1TllzMXNiWVZLenJBTDV0bzRSV3kwV3FaS0FzdkNqWU5OMkpR?=
 =?utf-8?B?RUhTZi9ZbEp4djJudGNneDNWN2I5OElDMC9qMTljSk1rVG4wYU02R29Od3dL?=
 =?utf-8?B?NWVqSzBORkhBYlhjQ1VNY2lBdXZCaTJRTWVBWDlHdFpFTFkrc0xhWG4yMWhq?=
 =?utf-8?B?cHpZbWN1ZnlvbE9SdzcwekQ4dG5VdUdjdEtLd01ldk5Wc3FwQnI1dUNLZDli?=
 =?utf-8?B?UGlQSThTZVNPVW5sSytXVjYvOFA3ZDFCckZZVnRDYTRFeFludjJkdEU0cWlk?=
 =?utf-8?B?RFhFaWdEVVVHSDh6STlKOStXUHFXR0ZycVhWNGp0N1JEY1NSZGZ4SXJneTA1?=
 =?utf-8?B?Z2RkQ2NJdUU0RXMrUmRlZ1A3a3M3TjVTRVVSa3RSY2FFZ3R4ZExTVU9vMi9Q?=
 =?utf-8?B?WVM4RlpRT3pCT1B0OTF0K3k4Mjc5aE9na2JaTmlHbXhrY3hUSTZVTk12blpK?=
 =?utf-8?B?dzlxVTlTMlpMa0drNmhkODJlTGNSbkR3cmg5VXFJWVpqMWYwQXRtQyt6cGFR?=
 =?utf-8?B?MUlNbkVIcWhxN3lKNXJoSlVyUEl4aG1NUVozMVl0Ylc4SDFicHVJb1hvbWxk?=
 =?utf-8?B?Vm9TblJXNUdLUnhiem5LVHBQbHNWaWVqb2ZlcUg0MEpqTUdta0VHTGJYaGZL?=
 =?utf-8?B?cG5jMGV5clBvT3Z4aFJwcnA3eTVPYnZhSkcvb2FpZVRIVStmNEJOTjdDS0xL?=
 =?utf-8?B?OGVRVGRsa2ZPRVdRQTd1VXlncEsveFBHY1FjZXVOcVBPY2UzTG5ydDV4MUFz?=
 =?utf-8?B?US9GVWhGNVZ4ZS9ncjgwSVRHTnFKZ1dqd21iV201dlUzc2tSSzBDSWF2Mlpj?=
 =?utf-8?B?cDVkVXg4MUw4MGNheDhFbGUyQWFNUlFnZUJuTGE5NnRDN1liYVpZWWg3ckRi?=
 =?utf-8?B?SHVhaWMveStCZ3NQbnNweXFITzF0R21sR2VIdHptSDBubUtmamIxRDU0Nytu?=
 =?utf-8?B?S1EwTTNId1F0Uk41dlh2RDRiVk94NG1XcG1LQytrNGRwY2tHckx6bDNjNnd4?=
 =?utf-8?B?cTZteWY1WVQ5VVIyMTZuM0cvV1BlY1NTVTBJTU9MTzFtSEZ2Y2Qzbnl4a0tZ?=
 =?utf-8?B?bVY4dUs2ZjVlOTlOcFNkYlFIWHdscmZpdjdITGFIVVZGWTR6d2FPTS9yaS9m?=
 =?utf-8?B?RlBpQ2VzVkFWU2dhSlZPUWR0Sm5vL2J3VWtnRHRLNkh6T053blpWQ3pkRXVK?=
 =?utf-8?B?eHp5WFpzVGU3cWgyNGIzclZ5Z2JwZFgvVVpzZjhkQm9VOGU0bUlCeUlodWMx?=
 =?utf-8?B?ZGdkRVJYcGZ6SWRaREVHMDFDd2ZIOGkzaUQvUy81ZFhLQkt3UHY4aGkwN2NR?=
 =?utf-8?B?MTk4QldVZXA5Ylk3TjBWLzVQbjIreTBBY2UvN0dwRHkvUGpWQlZldzF3TVND?=
 =?utf-8?B?Vnowc2kzc0JEYnZLSFRiNzBnbUtIVTRKY205SHJzTzlwRkd2NSt4bVllcG14?=
 =?utf-8?B?VTdpYWxYUFdaQjRhQUhrNTJLK1FNeDN1L3QzVFBsVXdoWWpFaUF6NWU5R3Iz?=
 =?utf-8?B?L29YNlhvSlNiblo2MGxQY0c2ZEF4UFVSN2tUUUNaUUZyc3dndzNnbC9oc0xa?=
 =?utf-8?B?eTdIRDdxZ0xaUEpoV0RMd1RacFhHSkFTNnVtWGE5YkRhc0RQS1U4ZE5BN1FM?=
 =?utf-8?B?WEtxbjNnQkhPTHE4Y0x6T0hYb1hnLzNvMjlwLzdlTEYzdGI4WmlnN2NqSys3?=
 =?utf-8?B?WWk5TnRHQzY5a2NJb3I3NlhjUUV0d0MwVzVjMFdNeUJjc1Z6NU9CeGp6SmxB?=
 =?utf-8?Q?0C1IoCjWxPMGFUXU8/X1pMzey2OhD1uV39Fq4YV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c3049f-05d7-4176-6516-08d9325cbcde
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:26:53.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1eTy/RMsA3TMQOprj82gqIb4FT14k0l0lPcZfKffLDbJYlSf9x1Bq/X2WsXiU5LyOQLb/YkbY0nSvEwvSDRnGQmBRbq33DicMIl+eioJ9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4679
X-OriginatorOrg: citrix.com

On 18/06/2021 11:23, Jan Beulich wrote:
> Some hypercalls, memory-op in particular, can return values requiring
> more than 31 bits to represent. Hence the underlying layers need to make
> sure they won't truncate such values. (Note that for Solaris the
> function also gets renamed, to match the other OSes.)

Spot the environment which obviously hasn't been compiled since the
4.5(?) timeframe...

Also, I'm fairly sure the comment in the NetBSD version is false when it
says it is copying the Linux way of doing things - I'm pretty sure it
means copying the FreeBSD way.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think the commit message needs to state that this doesn't fix
truncation in the Linux or Solaris, nor the truncation in the
xencall{0..5}() public APIs.=C2=A0 It only fixes truncation issues for
FreeBSD, MiniOS and NetBSD.

With a suitable adjustment, and ideally a fix to the NetBSD comment,
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


