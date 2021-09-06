Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5929401F5E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 19:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180157.326681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIqs-0003nq-69; Mon, 06 Sep 2021 17:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180157.326681; Mon, 06 Sep 2021 17:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIqs-0003lV-22; Mon, 06 Sep 2021 17:56:14 +0000
Received: by outflank-mailman (input) for mailman id 180157;
 Mon, 06 Sep 2021 17:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNIqq-0003lK-1j
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 17:56:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7e7d00c-0f3b-11ec-b0b1-12813bfff9fa;
 Mon, 06 Sep 2021 17:56:11 +0000 (UTC)
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
X-Inumbo-ID: b7e7d00c-0f3b-11ec-b0b1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630950970;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nUUgfuP/5TszjZLkwkCThXs/nKbossEJ3ZFdbxVQy/4=;
  b=VdP9eEEgjfZxZsH8EqLNkzkC8ElqsmQnrFjQ58ZgBTAVvlu4EVt/Fj9R
   DBx4BifmgQCc1QhGMdPA/WmPvdHFIz69lirh4wKIEcawbQ821RcZWKSuE
   Ht/2eW/BPy/1vbS2rzjChXxMIi+2tzeIb7rVkYMguMVgp1w1R1bqCsbPb
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VTba+8dEPt6A6J6iaSKByEmEkw0aMFkoYtidQv1hRx0YxY5+EnAN7UpcUB5kDVL2JHjW2+26lO
 XpO/mMUdodxRiegRNk0BDKY0GGZ/Rw6Y+FSuWwSYxAODA8ZGYcraUOiUjW/qkyeqiBLSlnkLlu
 xO5m7LWenx1qQQX/KWO9CDAV/D8OUFUqzsGavDv8zjCl+FSxj8jVGjxhk3DlFz+OzNJP+33JHK
 mnAEUzQjty6ag8jF4nhFQPEYNGwR75bVVh5XProTc5HcYuJHrJtl1UK9EJp+oqavx4C3xescs6
 ivsGM41ChjMZAGDb4BJj09g9
X-SBRS: 5.1
X-MesageID: 52104379
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+OsgBaHFsgLfSlk/pLqFf5HXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4hgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pas854ud3AMV0gJ1XYJNu/xKDwVeOApP+tdKH
 PR3Ls9m9L2Ek5nEPhTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHo/I6M0r9
 gsfJ4YzY2n46ctHNVA7dw6ML6K41r2MFvx2VKpUCba/Z48SgbwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52104379"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB6JAMJ/Pj8vs7eF5ZcC9l8HXHzELkpIKv51WtTu3KsdoJpGSOP4M7Ay1b4euGIXes/QJFSItg9E4r8/wM9zCu3DS75EH8tEiOpFDOaUn6MsnYNf+g+yQZxeLrbBWynXOnRWngo0qj5zZl1Lhp4vMv0V9Ym5iEPUhGnlWlIUGUeJijRAG8uZgerxLlI5KyXO8cLB02hhPNkqyJYuyaRP30VTS5ZjpPIisZCa5UVXiuaMgr7hGj+sm6C5RjNNQzo5eIyA++cHaXg/jmRggeOsHXzjrkVR9YJUViyi0djsye2h3KQRpQVLExFI1mYBy5HfP7T5/bxwWG8RKor85GpO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nUUgfuP/5TszjZLkwkCThXs/nKbossEJ3ZFdbxVQy/4=;
 b=MpLN5pe95YsLzzPIYsAX7svDgN/b3sg0GnV9xye/8v6D7M8RyunHwTSWxYFkWXCn+Fte0dlIyvMdswYArko722r2gDElDFf4WdbdP88sxDJ4DiSiGaYAay6PfYZ30VKbl9jRhaqR2TbY1UyR8XMeysVrzlWWTwi2fOhM08swALeb7IpzPyJEq+pPpsn8UMXGNJNgmb67z2ZEB/mVgzlc75pqwoZW/Ks/F5Oc5hKO51HnCq7GBIT0HhfqeTXavkvfXpEZKUffneQ4+ByOv09B2do+05qFB+hm9cgcyXD37i+mruoYAiALWzJE2K2vo/afjO+IE1gnAjfxeqrbZ2UnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUUgfuP/5TszjZLkwkCThXs/nKbossEJ3ZFdbxVQy/4=;
 b=jYd7M13FwTE+2ZwIBNvVGapfUtt3pCPVWZ38HXQIqtlNEcyqlX3mw5CPSyM8Ae9tG3r61QqVexu4vF/ecNvdVLLk9Rs7HEsl42TwmRXGUo65AvPeHGHGMBncLYcCC8MMpSbUKPGMV2vOsacyJ/Srvg1d8iwS4IFC341FjCyS4D0=
Subject: Re: [PATCH v4 02/11] xsm: remove the ability to disable flask
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-3-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fc0a3a17-8896-e2d9-bc10-7ca4c277d4bd@citrix.com>
Date: Mon, 6 Sep 2021 18:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cbd5bce-78c7-4ec9-d9a0-08d9715f9a95
X-MS-TrafficTypeDiagnostic: BY5PR03MB5000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50002FB7A663D42015EEFE7EBAD29@BY5PR03MB5000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kVqkyrgTbep0EFVGZSZOxvecFukYG9u1J1AXU824VmPIBVA8XV+4YSS89eFJxCaKZ1l9h2vt5agK98ue1BV4CmkM2F04cB9/kP1pGqbUU0gxA3546/vPDee/r2LAE/ZeojzUz6f4aipBqiiiL/yKuspqaYnJZRL/YO9eNOE5GUTdY4kHT4Bz0fO5/6fkOgeQDFyZEs9R+PcQyRcabVM58SCcpUbgsvYYbBw1UB+5dgeOh9SScGhbz8oXyqx+9uFzpY6mo1OSV7ADhqRiZkDxCCLbVKIHuOitmOXdi6binNInlIZQ28EIL4qbOWSmTswqJdhYEa5o77+MD16C1ozERyLizIzm1dPDJv4POGJVGO+bewqwGtqwYG8VmODNRW+h+0ykNkzaWYvxPzuPEuM3EDaPMPqoL67IvLpqIOlpwOwIb0VTJStt0Ahas3KHpSShSHzoxQDFzBl45zD8FhHxnHon4yniVkgykR1r/FgXtnwg1dtzx5Ht9LfJeFfj/Z1snW8hsoyEh1lM/ZASqsrjPhhlqqKelR+kbj0+RE8hpqS02MhFZ3MMykt/rEkdu9aPpQ4mw8NSXxAUYb4VQY4UjEh2Ytro+6XJlqv+Z5BfzrQzhboGYZUkka2R8WAu2RpgM1PdFV8dU4VW/wvC49cKEqcA/jT4KMDXrHSkjgFf7lsuJj1tzcGQAoYEppTtJf+Yp/YJulUZqXt6EklVdJfTrs7VixxOzw792g3wWAw1Z8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(4744005)(66476007)(83380400001)(2906002)(31696002)(8676002)(8936002)(66946007)(66556008)(5660300002)(31686004)(16576012)(36756003)(6666004)(2616005)(54906003)(186003)(55236004)(478600001)(316002)(38100700002)(956004)(86362001)(6486002)(26005)(53546011)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXdndnArVThQWHpTM1IwZFZCSCt2Q1RWLy9wNDZ5a0R0L09lWlozT3RydUUx?=
 =?utf-8?B?TWsrMFk3MVFpMmM0L0dkanV5QXRyY3h6VENRVk1KRmwvMm0zWE5UL3YwTVZJ?=
 =?utf-8?B?VjdaUTQxOW9VVjczc2RGcG1FcTVOMmFmbVRYNUNBRTFlZUFFYnRYcFY2QU5s?=
 =?utf-8?B?bE1peFNpMkdDWE9kSWMzN2hYdDFwbTRPd1hUQXg3TisvYWcvT0dtOEtoOGoy?=
 =?utf-8?B?ZGk1SGJxbkVXUzV0NHpzVWhRVmJYcG9EOHZGMzUvcnBKZXpWTVZTa0ROaFdj?=
 =?utf-8?B?ZGdWY1E4ZlE0SGIzMkxCV3dLaFk3cW8zQVVwNVFjSmRxNEowNnNkSkprMkpl?=
 =?utf-8?B?eUpTdFVWWm1LZzJldmxMVG5UTmNBc2dXdTFxeTdwc1JNTlE5THErU2plWjh1?=
 =?utf-8?B?bWxiSVpESlcwVjlWWUprdmpEMjhuVXRUTWNSdXpXTUtoN3U0citDYWhBc2lZ?=
 =?utf-8?B?NHVtdmY2eVFlc0NKUDhDQ0lNUUttaDRONys2TmlWWUdqalBJKzRyblJWemhG?=
 =?utf-8?B?ZVg2MGE5R1VjNU5tUUx0Y0l3aG9vVENQUkExRDlEQ0VWNDIxMk0vNmxuZys1?=
 =?utf-8?B?Z2RxbGZxQ1VvVGFnOUlxWUVGRkg4WEU2MGxNSktmbGZZeEtDYzZzTjQyQ09h?=
 =?utf-8?B?RnJuM0lqZFgxNHFVREloZVBVa1dKTExRaEhPNDVCRjY2a3ZqVGlHd2VCa0Rj?=
 =?utf-8?B?S3JsM2cxeXdwSzJzNkRGZ0lUNnpRa21RU0FzK215eWxia2pkQzhKNW5OWUU0?=
 =?utf-8?B?TkhyMU1JUnBUTDk2VDJ5TUJkTCt2U0NKYWpsYzY2WEFBelRUZmNoeWU4dTY1?=
 =?utf-8?B?SzlSV0g5UWI5eCtwdEtibk9jL1BWKzh4R3ZtQ3pvYXJDeCt2N3RtWUJxWDhU?=
 =?utf-8?B?RFM2bno1ZHNYcWR2cThHdUFkNmVzYW51c1ZWWVFyQnREMEM2RWhPMFlIQmJr?=
 =?utf-8?B?TkVwZlFzYmsyZ0hna3VCMzd6c1ZuMHRONlVhLzRDemhCOWlGWUZsV3pwdXEw?=
 =?utf-8?B?YVM0c1k3Rlp4SC92ZVBoejMreWkzS3NqYytKYU5tMERDdEhLTU1ySE9iU2p4?=
 =?utf-8?B?K3lETWozMG0rNTkvSHA2dHlrdnljQzgzUjFUVFhtVlR3UjJrb1ZFN2l1bnVq?=
 =?utf-8?B?dGU5amxFTy8zVE9MQ1gramExaEF6d05WU3orazVvajdRQU55WmVnRjdzcW45?=
 =?utf-8?B?WW96a0tFOE5JNVV3QkZSczY1dDA3MmFQOU1ZRUR1VkdNeWlUUlNWczNnc2Vh?=
 =?utf-8?B?dmxVbXkxWDF5RkJXRVU2SU9xNnduSkVIdGJlRzRGRlM5NktWLzJrR0Y3Qktj?=
 =?utf-8?B?KzJEZUFacE9LbnV4dERyMHl3Rk0xTjZrRm9ZaTdOcytXc0U1K0MyRG15S3ht?=
 =?utf-8?B?bXRXY085NC9YdkVheVBUZS9VWDhobG9yeklTTGZkcXhxMjdiTFFlNDZkditD?=
 =?utf-8?B?QUdBeElZbDFoZWdRUE5JRjFqQU13RjRBanFtY3dXL2lnUVlaS0M5MmZORDM1?=
 =?utf-8?B?MmdmSUttUGptTmNqdHk0RkJsZTh2a1I5dWkrQXNUU2JsR1ZDRE11N1VnNmFE?=
 =?utf-8?B?b0VpaDY5Nlcxd2pkTDhGOHJzUVVVY04yZXlNVENPRWxXVE91R21IMVJGOE51?=
 =?utf-8?B?Y0I5T3RHcHNrVmc4S1BPZEpWaS8yRmxGWmQwalB6QjUzZjVuak5XcDB2V1hP?=
 =?utf-8?B?aURRRkhHT2hQVzNyZDlHTVIwdmVEZ29uOFphS2hoNTZ5aXdTdVlFSHhMNTlS?=
 =?utf-8?Q?pBl7gKf1L6t/vlW3UiSvEVWnAdTZBxQo1C/eNnH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbd5bce-78c7-4ec9-d9a0-08d9715f9a95
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 17:56:08.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntAV3uvyfkLAcTeYHRu8x7TH9y+13DYdQCu4ydXwazvhcZ6aMLw77icvvhntVxD3rc2hV2+4JYmvJTTDQdWaiFWfFm8NfX6pX6qNMWWelZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-OriginatorOrg: citrix.com

On 03/09/2021 20:06, Daniel P. Smith wrote:
> On Linux when SELinux is put into permissive mode the descretionary access
> controls are still in place. Whereas for Xen when the enforcing state of flask
> is set to permissive, all operations for all domains would succeed, i.e. it
> does not fall back to the default access controls. To provide a means to mimic
> a similar but not equivalent behavior, a flask op is present to allow a
> one-time switch back to the default access controls, aka the "dummy policy".
>
> While this may be desirable for an OS, Xen is a hypervisor and should not allow
> the switching of which security policy framework is being enforced after boot.
> This patch removes the flask op to enforce the desired XSM usage model
> requiring a reboot of Xen to change the XSM policy module in use.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

