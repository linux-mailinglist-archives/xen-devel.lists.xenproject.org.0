Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8417C32666B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 18:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90529.171445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFhAK-0000qb-Bg; Fri, 26 Feb 2021 17:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90529.171445; Fri, 26 Feb 2021 17:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFhAK-0000qE-82; Fri, 26 Feb 2021 17:44:36 +0000
Received: by outflank-mailman (input) for mailman id 90529;
 Fri, 26 Feb 2021 17:44:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFhAI-0000q8-3r
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 17:44:34 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8c424bd-9097-479e-927a-7a76702572d2;
 Fri, 26 Feb 2021 17:44:33 +0000 (UTC)
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
X-Inumbo-ID: b8c424bd-9097-479e-927a-7a76702572d2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614361472;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YknpcX4TnKt0uq0H9eu7tiHhoQ5t7bkxn77kHUtLvT8=;
  b=ifJuR3YS1XqL+qv8NDtHjO6DPcIRZsbU4mFDP0ugX3vjiPYY0wT6H8J3
   NM1k20wGGeqxa1jT47pXC+w2L8dracukP0+/ek+dED+mfPlAjFm5IEvPK
   ZoURBCNkWRXmls/7OMbnxhl8SgwWke1IS8rdfr+yb7G7x8wiXwt6KtJOa
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Np7LvF285OgHQivTAT6IEhtxafGNLh7c3xMgDttjpC5FAtPnxLcLRirTDE0WVVUltHKFO7VbUe
 268R7MVDeWJPkMV2RNGueQ/K5DG+OfZ9M8TA1edDgt8CrUQl069MgQduQMlAIwtujxslk4TGsy
 UvQ+H62m3oH9GVCwVEQuoqc4nbyLCpnKph78igj85W1IWzX7UTrEQO2Z5Tdv9mOqIC1z8PArYj
 eQZVhsbvwcKEGfBPn1yFRDqTsAvtVx1p2RB25dtMdnRwU7ar690bAR+WbQE3yGPlPpl4jyn45E
 TzU=
X-SBRS: 5.2
X-MesageID: 39524274
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,209,1610427600"; 
   d="scan'208";a="39524274"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR55csTaO518pPo40zWRo63u93oXXTYDz9bbIsDMbadje3Ji/5tcUhZkitCVqTrjyl3qpsdCD3uSGHeAV2cKxFG4z7lVDtoHKb+QawHYj2eng854/3n2RYjNA+9eoF1FagPGEWkuRa/BEMcEnEZYszkkLaDb3GjHTMfINUrW8/OJgw/5tku+mS4KHfL72CGCy8W+Uji7dFf044P3hF3RW1xpP1TDHDOVRzjWaFfENhn7THJr/sPp5OMnnxdMqPTmrGNCxEd3iZGbzADRpSdLoH45/QTqPYDd5T/WQohzNFyyS3vUErMhtKpgoqVEZnXHvta+toH6kWPpm48Yv+liIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YknpcX4TnKt0uq0H9eu7tiHhoQ5t7bkxn77kHUtLvT8=;
 b=ZwqeY0f1AqywObCFQwsxVfQ0alJEVJcGMYCmFqEiuWAHa0k0uDqIC0QVV1qLpNRKO6pWJ/LAMdwD67zOzeDng3R+rYCbZXw34R8P4Hp1cvnrsE3baxzL6pXA5RqG9Jao9gkP5BPgSWQ0x6XNAuO438QzBeKhmTF+gS2dzbgNW7wEULxHOqsw5GRx/xvF1lzn1ElS2J/b6BOU4h8NLdsO1zpl6rruo9LeNWzAav2AP7rOvPSKRWVHDc4ucD72NviVSjgod110xxnZIda8qeRJQGF3/TPw9P4ZuLOS9TGUq5IXgzY75Aucr+PzyXGiF5cn2jdiOFBU+4FzB8tdXFi/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YknpcX4TnKt0uq0H9eu7tiHhoQ5t7bkxn77kHUtLvT8=;
 b=UbRKwXQ2jnCX2eXGsR2DyZUFQtCY7o4qyYebztXiCyEvCyOSg1lQY1wmvQ+pTayUoPqLXXTr5OZ0WaVKUlKi9qSe3oBElyLE17AbacO8oM+B8q4sre70poohzMmpzemfACxQHf+orMNXh+4YHa7/pztbYdTW1cg6+RmDDh/+//o=
Subject: Re: [PATCH] tools: Improve signal handling in xen-vmtrace
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b04c6b3a-08a8-7507-7f3d-24d179358761@citrix.com>
Date: Fri, 26 Feb 2021 17:44:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6621352f-e990-446f-64f9-08d8da7e2a2d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5156:
X-Microsoft-Antispam-PRVS: <BY5PR03MB515694FD429DF03A0031CF8ABA9D9@BY5PR03MB5156.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUbGNbr08U1AA5S0CWrcItklIJpRy2vmUWKA7mAs//w8geaxCUm1jUBYET6O4LAeOka94MT6wWV9Sge2fhjJZJUB/2f0sXWXo7VvOifeLECI22OrcOKiWw3H2ztdRaCa2UgJujCvOiuUw9Dc7K+P99+c4xy+/1zEOkElYtY3zk5uRbq/fd6aZxAsTqWb7FmFLT7qv2qYEpgmM+w+5kCFG4Ai8TxVO7XFSOC+TOrJnec5Tmnfk2qik/M+eINk2M6N8ob5eBTMPfClsau6p071yvHZKbqyvi+QqRY+Xhr9AiDl0irFBrUFBs5sa9MMo3l8hI24/ajBeWyoOK49NA5XxipsIFL/wW+1XdxLaCDZJvFM+w2cjyxxI74ZXJwUBdkrxcv9E76R+naxJHpZKELxei+trg6mgo4xKPr2RCTmQMQfNDrdWoaZjyAdIBbFPEtERDyzKs5Rr6BlfoEg3mMBW+or+eeQcnXB/EgzC0T4RuROv9ir2w1cAf+CU2DDs/85pB6KKbbcNNSCvWJk4r7nDRVqsHAn01pG+QJJD/2iNjiwbodTQrmKnPTYryMhazIq/lnWcB3sEdUhdn4xr5zoQKLzHEyRpBj7UjkY7UGuZCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(2616005)(956004)(6486002)(5660300002)(54906003)(8676002)(478600001)(16576012)(8936002)(86362001)(26005)(36756003)(31686004)(316002)(66556008)(4326008)(31696002)(66946007)(66476007)(186003)(2906002)(4744005)(16526019)(53546011)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OElGdzdQL0xxYklXb0czNFk3RWxCZVZtVGNpTUxWS0ROYnQzY2VTNFN6azRv?=
 =?utf-8?B?VFJQN1FscFQ3WUtwV2FlcTIrOUZMdGdodzArUlJ0UDJKMEtWTFJuK3hZY2NF?=
 =?utf-8?B?c3E5M2NZVHN3MXRhUzNJeDVoaXlJd0RwM0txQU5jQXEyMFhzdkJ6K25wSWli?=
 =?utf-8?B?OGRPUnprTDBxZG5qemVHdW13SkZ4REZEM3kzeld0TkFIYUpuLy9zRmlSZEpk?=
 =?utf-8?B?QTkydXpvRTJDQlpLUVh6cjgyV1hya0pza2tLd0JSVTRMOUVISEh6ZHpoQmRC?=
 =?utf-8?B?RkxxdzU0S24yb0w1M3NGcnBReDR0YUhiSUM0aTZKRzhWQmN3Rlh4RHErbERT?=
 =?utf-8?B?WUc3OFl6cUtSeEhhdlRRUDVTZnNUeWtuNERPbXdKSXgzeUdzVW9nV2F2Zmdh?=
 =?utf-8?B?YllRZ2lxdkdVY1dCSktnaWZGS2dhZ2xpenhKRzBiaFluRDl2TGVwZkFuWkVF?=
 =?utf-8?B?YUpFc25IRTZJY3d4NG5BOEx3RDFzQTVONkZjY0VwUDdKYlFES0ZiVytSZXFJ?=
 =?utf-8?B?aVZmSytlSVhNWEhYbGZwZ2NUZlBVYXpZUzA5U3RjTDA4cHc3NXJBczRjRUJz?=
 =?utf-8?B?aUp4cVg0NzNjb1NUenhGS1FqWE0zYW5nSVRrT3B4b2tYTUQyQTJTUDFCUzdn?=
 =?utf-8?B?VnB1OXpGWUZ0VGFuU0o0UXdFMGNKVjcyckJFK0xBMzBBQmh0OG9UYUlkdTBI?=
 =?utf-8?B?NzNwcFlqZ1ZVT3lUaEdkdC9PdUJBWWJaa3M3QVdGSUJUdU5XK05iNGNCcjFl?=
 =?utf-8?B?UFhpZzhqRmxmUU8vNTRqYXQvbENROWZ1c1dBdlgxOXRWVW9vV2ViMVI2Q3ly?=
 =?utf-8?B?UGZGUmZjYTdjQm1kTGIySHUzQnlaOTVFeC9qdVdCZlBLNUVWT0ZzSGJFSDQv?=
 =?utf-8?B?UHl3OEY3WGNiODhFamRicU1aYUtGQVF5eGNVcHZmV0hFeFJiWEZKSld3ellN?=
 =?utf-8?B?SFBZWlpSRGdXK3hsbWxyUElvNDluVGlJdWo1bTRROVZ3L3lmdjJ1NVlobWJN?=
 =?utf-8?B?cG5vYkJaQ1hOZGRSZXB5Sm8ydFZNRHAzeTN1cUpEc2Jnc0pCWVBoVjd2V0pC?=
 =?utf-8?B?bmFMdDYvd25BTE42S0c1SWxWR3YyUG1sRVVzMDMyNTdjNWZ1SUtkb1N3MTVo?=
 =?utf-8?B?cmxjWm5kZ3BGNHVYdzFoMmxQeFNPOWNaSTNYNnhtNHBMQlQxa3Ria3JFaXNW?=
 =?utf-8?B?NEJzWGMwRlJlbkdXbVNwZTdSWkxoVzZvd1h1WnJuQ2VWNWFIcmYweEI5bW9s?=
 =?utf-8?B?d3g0ODlCK2VmOERxa2Zrc1hnR2tlK3paaE9LUTIrZTBydzZMV3hiK0lnemNw?=
 =?utf-8?B?aGdkRUJ0OWkyL2ttZWlKaU5oV2ppWXZhcmU4b3BsWGNtRm1DdVh2aHVhTGR3?=
 =?utf-8?B?R3JoNUlqM2JWOTFmUjhzUlVUbnlzMUdKQ1cvUngvTVVsUnN0WElLNHZqU0ts?=
 =?utf-8?B?RXpoOTc0aENFb21xSGd1RE1YNWNyMlNoMWJCZ0pKUHFjK05HcnNkVlgzL3Rl?=
 =?utf-8?B?ZkYwSFJPSFNYZ3A1cytWaWZ0ZjFJRklTbHEwT0Rxci9UVTFOc3pUY0M2Smxz?=
 =?utf-8?B?bDhmRVljUU42MnBUNU9wQXl5bWtoZWozb01Xd1RySVNYcEY1RjBRcnFMVnAr?=
 =?utf-8?B?dGZrYTJpSzZkNUd3Mk1DNlFaYWU0SzdUUzNKeCtiYVR2aU9pekY5TkJhYnBi?=
 =?utf-8?B?VFYrbElWeW1RTkdwTWRkeTkyRjUwWlRsMjBPK0prMTQ0TU5Gc3BybythTGNa?=
 =?utf-8?Q?M9K0z94YOWsO7oEAt04EDpR9S8Wq2/KczolHoAE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6621352f-e990-446f-64f9-08d8da7e2a2d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 17:44:28.5965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLzd3ErdpJ6fJ0wtCSPPl0EDlwtnZOh3dtZ2ULuKkQBS8r3Q5QXI2DkKYztvOquCy0RUISx8tzWBZK2RTM4IRThhvbXNOhOSuXLFIWKK8jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5156
X-OriginatorOrg: citrix.com

On 26/02/2021 10:59, Hubert Jasudowicz wrote:
> Make sure xen-vmtrace exits cleanly in case SIGPIPE is sent. This can
> happen when piping the output to some other program.
>
> Additionaly, add volatile qualifier to interrupted flag to avoid
> it being optimized away by the compiler.
>
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>

Ok, so this is being used in production.

In which case, what other signals potentially need dealing with?  Lets
get them all fixed in one go.

When that's done, we should make it installed by default, to match its
expected usecase.

~Andrew

