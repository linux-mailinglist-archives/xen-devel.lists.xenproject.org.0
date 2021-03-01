Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4EB3283FA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 17:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91792.173193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlQ2-0002HL-JX; Mon, 01 Mar 2021 16:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91792.173193; Mon, 01 Mar 2021 16:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlQ2-0002Gy-Fp; Mon, 01 Mar 2021 16:29:14 +0000
Received: by outflank-mailman (input) for mailman id 91792;
 Mon, 01 Mar 2021 16:29:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGlQ1-0002Gt-IW
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:29:13 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10cc2fcf-02eb-44d4-9ce0-99221349d863;
 Mon, 01 Mar 2021 16:29:12 +0000 (UTC)
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
X-Inumbo-ID: 10cc2fcf-02eb-44d4-9ce0-99221349d863
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614616152;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LykhiyzEKqzLpE/Bxub2iXflwNxjV0ISzXDM2pVTuzE=;
  b=Gq9uAf8ESvF8XAA7iJ6a2ZySBvuvs68IWj8mXD0x/utTlqF5MEtH7ugg
   g72jSHYX1TxQeQRvCDU9iOW8R91cVJqhbnH/97sjBlqYew2TeZbzZtC0Q
   zPF8vyJNC6QfxoTfSFSQHtyq/di/1e+2bVSz0mhVWoe7W+0G1dcNkcqoZ
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MCQYJ/UTQuK2kgZYQtECQ+F/ki4deWRNPfH4ue+HdmHcHUvJBfs1JNivtwQ3Ysj/rd5FP3FFc0
 bwf1IvmqXeSimDHkV1lN581KcsqfH/0EwJl9vYHORko1TxUaXpV4lVQ/iruCqltTP3Sy9pJc3G
 77ZLEUaDDQ0A8na89uppfCBkkfy7rN7unHe9VgmQWM3lkMiWMwTSCeLelGMe9W/FblhTAR/nbU
 sXF09G5Ssdkf7B1acxeLsjZ4JIugB85W6+DT/R9dw+HcGn+xND5I6iyHvexIlqc7xzm+Xgd/Ze
 7+U=
X-SBRS: 5.2
X-MesageID: 38251893
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38251893"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvuWfI1t8fo24AGQN2t+2DOuPDHN/Lx1toO/+lWs83CUy9b5OjZ96FBsIN4vVanBl9peNBbo6X18U9ztERVEW5pw35ZIsV8XBnIQBCMeB6Z0THr/LpecfU0cRkEgaWb2fUEmvMBqEUEwupiWdgFcWqrST3LlvwU0stHB4bEYfrYT4numr4H1tGeh5jL6GRTbQMgi2A5cg5P50/0HcIUHe4O0CVyrB2Fayrwo1a30HTWyzgi1qTFy5qeAb32YO7LehTiuP1tw2QqyWXsZydhX1FAKNQhimgGIVwiiIXGkxBTPTRXkAq0S26XND8BlaQio0p2JRcTWUaBaUQZJsbiO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22T9Ps9M+0+8OeV/vYT2CpzRp/Jj31Q2DFynmGyUkmo=;
 b=hsPb4V6bBihmYtK55fHsESQLdRVPc/FMjR5he5Kpio4KUQkrY5bXy8OLHzqDfE2ihDxbcA2p/ZbEEhVCiZa5o3s/R+piLIklILyPUC4s1tMJZrxPULxYbfQKrtQi1GJ5iDyE6hlHkjw6e79QyTKqYnSfC+EjW1lrSvRNbuP/9Q8EdKY+F7789ylrJ3WjkNspHqREMX0YkacgX9P0dZhox0cR9WWLktePTkmoIeUC9IWwHwa8H2NbAR/QwcWmdWikIrNVALMBfNsEpggAY2JhyukW0+LDnpFJG+aRKVimJlXFiRH4xZKC4YKvWoN0U1KH3suqkQdAPq39zv1b55TA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22T9Ps9M+0+8OeV/vYT2CpzRp/Jj31Q2DFynmGyUkmo=;
 b=FOzRHwJJlf1xflhZ6v+VbiOGLczCbfwqWRarA5NxNNGD5IKuRoM4BMqqLbZdwI2u90f3DBIX+IM60OsAItCZLupMoq00jAQHB+7m0cNx6p5EFxNxwVU0io27ir0kVzcXrzpagwbZI5ZWT6gJ5kRu/wPQXGL9OEI8aI4SyewgFr0=
Date: Mon, 1 Mar 2021 17:29:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH for-4.15] cirrus-ci: Drop obsolete dependency
Message-ID: <YD0WT2s8Un+lWm6C@Air-de-Roger>
References: <20210226124647.19596-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210226124647.19596-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97fbaf75-b6cb-4d05-09a7-08d8dccf22e5
X-MS-TrafficTypeDiagnostic: DM6PR03MB3676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3676B957A8012343DD4466D88F9A9@DM6PR03MB3676.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2n1v8D4uL9qyBsaDiIqaUSpOg/LGbpJbbUG7sI+rFAWEe46A5SfBAHZy2koLCjdvpKCiHCcoRoKveI0LUfumJjU4+ZcwHdf807Wo/LS2AJ/fyCkJPiYBlMsv8OCHtYZyEzZD/45kRcMCIpCKgvpGH2I9Li7r6un1Z46z1yIl8ioiiRPuWOmX9noHcyNY6VBOmQItFiRrXq2PcOMA4mFNpXExUmQMs4OcXVHvQ9tZaUm8nYCglnwqKrrz1gpmCppaavfFe+PtKbOAWH9E0Dhxe1qj3rEKlUiNeEFo5i/ja11lX40fgnjh022b1oKbI+FIf8XDVrc9Ui2TkQTV090CNmmrxpBYMxiQ5Ilz/+g0+MeC7V2I3tA+xHhHBuyXNUjnQ7xHJKoBBIh6DvKcd1PN/S7yANFqD0nXcd30z3BVc8TK4kpI7TfpCOhEwu7DEHJ55Ga8DKD8djytXfbCm9kAW6aMBy9rTUQzBZ7tNj04zFloKzfnpOmLMEXq9+Vpo7BdfMrnQ25nepJfiiyMQtGWgQpM28b3i/miLYNn5p0yIvT+CG5SFBIwMgYfp7e9oCRb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(83380400001)(186003)(956004)(4744005)(6636002)(26005)(66946007)(6862004)(16526019)(5660300002)(8936002)(8676002)(4326008)(6666004)(85182001)(6496006)(6486002)(66556008)(54906003)(2906002)(316002)(9686003)(86362001)(478600001)(33716001)(66476007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFh5Y1VvQ1JiRXh1ZWRVTUNWZDZEemp1cXY1YkdFN1lOaW81cGV2YWtzOWYr?=
 =?utf-8?B?TkxRL2c5UHRXVjZOYzZqbS8xUVBWeFJ4OUFaRXNJVVNpNTRWTDVxeHZFcTFZ?=
 =?utf-8?B?TEtWSy9IdENNS1BCQTJKNzhGRWUvTUszL0JJMlVzTTRaSHViS1huNzM2NjlH?=
 =?utf-8?B?YWQrVGtwdTNVdUh0Nzh6c3FQVjc2SGRwaHd6SFhhamFwYkM1dnVzaGl6bjdp?=
 =?utf-8?B?Q2ZPdXRveURxQkF4OWt6bElnSFoyWm5WSG9hdEdjdFA3TXlLVHZGaWUycnNa?=
 =?utf-8?B?NWx4NUlTTzFFMkFFME12czNoOUhvSldCOStqQTN3WldZOTM3N3AwRFozZmxF?=
 =?utf-8?B?Tm1qbFY4VlNaMG1ZVlJveFF3Y2lQTXRpdlJEdm8yb3ErMzVRVEZFaEcwaDc0?=
 =?utf-8?B?MnFWWDdDWjBkOVUwM00wOEkrcStRTkoyR2ZDM1JXQWRESG5WcTZzOHlTMUkv?=
 =?utf-8?B?clZBaU00emRuYy9pc0NCM2g1OTBMemNxU3hJNXFxSDRJSGYvVFdDc2RMUFRG?=
 =?utf-8?B?ZEpPY2lZaUJ6ZU9LUnMrK1ZRWXA2cHhNelA3VGkwT21TQ0p3dGx6cVhpNy9T?=
 =?utf-8?B?emc5T3dsbHdaNEhVYTdEc3MvSC8zSDhaZU1rZ3Q4eGsvMFVVT0p3TWRZZlps?=
 =?utf-8?B?THVRTUltd3V0VW9qU21lR0VQZzB0LzlPTDZBL2tqdU9vbjZvWUl4MEw5Qmpi?=
 =?utf-8?B?VGd1MDE5YWdmVlJXK09NUk1ycjVnYWYzMnBBS2pXNkFmcGw3NWI4Qk0xYzVY?=
 =?utf-8?B?ZXhoWU5KaXdBcFhEOU1SYmlMbzdLSGNYTk15Nkg4VG5RTGh4RVd1aExXQVNh?=
 =?utf-8?B?eHkwQWEvWU92L1B0ZFF1V1lZcGdESVhaRVY0Y1l2Vkt0UDFRVmQydVd1cGhB?=
 =?utf-8?B?Y1d4MzBYVTV3WEpwTUxmdnBuVFFlWCtYMXNJUnNJbzhraUZrZHAyakhvS212?=
 =?utf-8?B?d1IxZ2pDdTJlcllKckJRL3oyS3dUZERnRlJKTUUvVWNGY0sxWE41UlUwQ1ZL?=
 =?utf-8?B?YW50R2Z0ckNMZDNPVXFDaThOczRWeFl6ZWZvd2lrREtSWkZiZ2ltd1lCQzFF?=
 =?utf-8?B?Zm1vOUVBKzNsRGtuUGFVWVNkZ1BXTWQzdnBZREppelRwRzc0cVFJYWp5M09t?=
 =?utf-8?B?eEMxVStmdFF0c2I0NCtRVmdoMDh6ZXVqZ1Fzd0QvTDdRTFV6SSs2MHpvU0VR?=
 =?utf-8?B?c3gvdVc4TDZnbVJUQzVXY0JWNEtVK1BjY0VqZ0NOZWJiajBIVWRnTFhrc3Ez?=
 =?utf-8?B?cHlaR21kaUdKZEtaMW9RejA3bG9zZjM0WjV0eE9vNjIrSVJPekFoa3pCOVZo?=
 =?utf-8?B?a1JpVHVqenRyeGF2NnZtaTVKdWV2K2xkbEdTZVU0WGJsTDJOVmpacUhXR1Jy?=
 =?utf-8?B?ZVZ3THNJc0c0WTJBTXgrQTNqc0pyMk9IZThScWZNOFo4dElzNUJ1SFBDcEFl?=
 =?utf-8?B?TU9PTXNucjNFajBEaWNtaEFvNXBKcHV5U1JVSlFZZmxYaVBGUmZ5UWhGdnJ2?=
 =?utf-8?B?NFdNc2hPRTYyN05NTytWZmE3RUxiMzRpd0hCRGc0MDZuQVVUb2tmNXo5SEJ4?=
 =?utf-8?B?eWY0a1RMRzhmT2o1TWl1NGpGaUpmSFF3MFA0TWQ4VVY2ejZxYWlxQ2t0RkFR?=
 =?utf-8?B?byt1OFRpS3BYRzV4bDVKUng1c2VsQVNiSUlyL2R0cGNaM3JOSzIzYWhMbC9R?=
 =?utf-8?B?VlA2YkNMZ2hPMGtEWGJFTTF6c3IwSytoWEJycFlPMmp4RFJOUklDMndaYjNZ?=
 =?utf-8?B?a1UyK2VsQ250RHpPdVY5ckZTMkIvckhlNEp0SU1ZMVNLellTTGt4OFRjN2dQ?=
 =?utf-8?B?SkNicEJnaDJXbHZycS9RZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fbaf75-b6cb-4d05-09a7-08d8dccf22e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 16:29:07.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC+69EP5Q5FfnB1iyrNvaVmhU/7clJxl75M6WtoD7iDFK/jDvP87o10FB591HUwtTaNBkOOXqsfEYKpDktPrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3676
X-OriginatorOrg: citrix.com

On Fri, Feb 26, 2021 at 12:46:47PM +0000, Andrew Cooper wrote:
> markdown as a dependency was dropped in 4.12
> 
> Fixes: 5d94433a66 ("cirrus-ci: introduce some basic FreeBSD testing")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Urg, I should update my list of dependencies.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Will add the required ones for the docs build in a separate patch.

Thanks, Roger.

