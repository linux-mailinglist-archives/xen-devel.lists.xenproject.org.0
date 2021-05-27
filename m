Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3821B393021
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133478.248767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGQm-0007Tx-Be; Thu, 27 May 2021 13:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133478.248767; Thu, 27 May 2021 13:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGQm-0007Qy-8N; Thu, 27 May 2021 13:52:12 +0000
Received: by outflank-mailman (input) for mailman id 133478;
 Thu, 27 May 2021 13:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmGQk-0007Qs-OE
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:52:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b6f9330-7cff-4344-ba10-e3501979d1f6;
 Thu, 27 May 2021 13:52:09 +0000 (UTC)
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
X-Inumbo-ID: 4b6f9330-7cff-4344-ba10-e3501979d1f6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622123529;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DmkTe83W6qXN7niHOKS/0hzIJ5/nQshOQDcNkcbLGQk=;
  b=aCMy4tJbPaii0vgRTq+alVDJQ31nTH0wb62/J5cMQi9HaKBISpnN0LxT
   kIya/n7rkGAzdl1lqEhiRSi841JZGBLoEplL12rb0J04tLUUDXS4lhiQ+
   MV0qgDQDG1/C3A63mLYLiTIzsLOhB/4j5Ljfnu2EkPg0UBiyKltWUDMBK
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0hCX7/cNoXc33z+Fn7JQAY3jv5QHiOW4G9xRdkW3rZJext3ahpkRvbHJ8dbNvspWxwCCDPc4y/
 A5yOHHN4rNlCm22b1v+tFt1w2AmrzBkNIpAP3NIZAyzcP72+wRqp/hUEt5DTNvQcJyAIQACMck
 R1Z9FF2TLen9P+KMANB4/kUKeBsopZlrK3/imx/xGAWxMhpYTgzQO6DD7x1r0UtLA6Dk7iyqfb
 3w7B+vWvfaFPbKzDfgE+QlfqyHG3z3l8ST0ql2wQlYHrPDp7WAeqgU8hBayXBVzmXfYX/JbOEb
 1Hw=
X-SBRS: 5.1
X-MesageID: 44854046
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rhysjqAWdAT4LU3lHeiGsceALOsnbusQ8zAXPhhKOGVom7+j5r
 iTdZUgpFbJYVkqKRQdcLy7VpVoBEmsk6KdgrNhdYtKPjOW3FdARbsKheCJrlGOJ8S9zJ876U
 4JSdk7NDSaNzhHZLPBkWuF+qEbsbq6Gc6T5Ns25k0dBj2DCMlbnkFE4mPyKDwweCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlQawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontlrcZrau5d+7f63+4YowwbX+0eVjUNaKv2/VQUO0a6SAZAR4Z
 rxSlkbToZOAjjqDxqISFPWqnPdOZwVmjrfIBmj8CLeSIXCNU8HItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3Glqz1vr5R5zqJSFcZ4JwuZkZkIP4jgbRq3PsiFWZuYeE99Q7Bmf4a+d
 hVfbLhDaxtACynhljizxhSKfKXLwgOIis=
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44854046"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O24Jqt53sqmXO8S//wa2F3l3V/aFJhbCMBeEr8t+KA+tMvMbpbc37U2krovYfZw1C0cGXnPq+jkvxbiHyJwlokuFy/lrDjD8xmlGIlHRMTRfApaLQ9K942mXRc4REU5XOytggExNvXH5cOKWfWNjf1pM2EBUMbu8OojgW69SDndd/rDmHIqQV3NEWdBjxPPqtybj6kj9R9VDMp/fEDiYT5KqN4C1pv+gruEsaPnHTtZSV+0I35jK4dakAASKTFtI2bj+h5xwjYRuYTmfZqUij5vzGe1EO5KUGqpNwx3PN1EQU+VtBT8gu/kMQbIibcKnUm9tzHupqVjFq7wWUjk/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXi3gMpug1YpZhgaWmWxDkKKcwRpKsgYNjrvQ5ysU7c=;
 b=QKnVqCyniTTYgho5OaaOB3PMkM063YQP/VnTJQ6BP8BDzmtifpqj+1qPDQ9bLvBW6pTvBgDHNP+Hn7iN0WpRhgiVfSfuJP20UtdAk+rizvAALPh0qf6qDno5TNEQBVlkht2Kn/3aR7ZcqmtB1g4QcYIpNPvEwqL7Q3VFl2wheEajzc4Dq+2XCvAexk1/OEITFyscNWtEnHPCdzzNNWA/EZyg9GUqGds/zdVtdfoJ+ILmk5YZn3FOx7683+Sfmk9UPYIlz2CXYm9/RWzdHCnEsQahwzttwfRx2Lc0Wluhd636I6ARkd7MKvDb4BocjPVRu82Yi2kdpfgvVcEWycuubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXi3gMpug1YpZhgaWmWxDkKKcwRpKsgYNjrvQ5ysU7c=;
 b=wXkSvmhK3YEiI4ZJ4FdtXb0Q087shOS6v4Qb7cC1IIaMuQEHLwrkEzQn6cwf2NiIrkVOfI4fc9Z+4QDDMbS1MRUmf/qbUdMUuTxBBQ1F4+FOUQOVivUmIKFls3E03Ds/r9vQFLHoMpLJ05qWSxaudGwzPcISVrYDHKTx1AJ06C0=
Date: Thu, 27 May 2021 15:52:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v6 3/3] evtchn: type adjustments
Message-ID: <YK+kAYv0YENvuuqQ@Air-de-Roger>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <8f7b57da-cd10-5f96-62fe-1a6e28c8981f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f7b57da-cd10-5f96-62fe-1a6e28c8981f@suse.com>
X-ClientProxiedBy: MR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81418143-bfb3-4420-e66b-08d921169d4b
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463ADC3C10617CF2723067A8F239@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnxMEWDhnx1MYRsa2cSwsXjJ+YUj9vVHP7RV0VB8IAckOA4fa+UboUlUtwVVEmenZG96oEVkX6FobqCtKsSnGoZQGwBpqJ2gQyfJGq/lVo6+b1XPCSyURcwV1p9nFKKDjsiqyQeYJ+TrZ5lRWmmIYjwuLpTdjvhPUD5XH2oD9nuZGoEAbJ+e0iE9Ec4BTnXb9kRFd/OebvOLEwtZZ7tiWAMbW8UZ/KXvYKjNkPiqKy5D3hvh9+syvgvlaOxrsLwugSyRKrnNlaJTMShmi4t+gdH2I/N1cbFphrLsmUw/REmrA+LZWPdNIBPfBaV/KV9gbtXqEPWUPBbkdovEhiS/LUumJ8Plb0iYU4x+FLkX9JSLNpvGU/KtI694L0hQCufJwr1BWILUy3Jx4wUKB7QMXUDOqwBJFgZltcNte7PtNGLaVodFr/c1czNOb9e1RPzpLhyw0PZnSYnPecbFH9zP8i1DKqm7oLswFNNDSK+OZJ+Kf9rGFaME4KcWc9dzwrjTp4ZCDH0YYuiZej4O0svsjiC8cTUSgvT+Kgv7B9rkLmrpDbA74dwCjxzMb+m6yCQMnPRgHveIbVWAZe68XK7KkuRom3NGJgSyc5mPOF3WqfcpUM19Lh13Qxm5QSCkpwmOwSQrgv2dxv9CDNVKLQhhFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(5660300002)(6496006)(86362001)(478600001)(38100700002)(54906003)(6486002)(316002)(2906002)(26005)(16526019)(33716001)(186003)(6916009)(9686003)(8936002)(8676002)(4744005)(6666004)(956004)(85182001)(4326008)(66946007)(66476007)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkNxaGs3Um40SDNNalhGMXRJZG0zazlmMy9DVkpVaEZEajRkNmFQVjljdjJZ?=
 =?utf-8?B?VGs0Zm9oc3VPRmlRaDB3K2piVzk0ODRrVC9EYjNYckIzTVJZc3pEM01rSTRy?=
 =?utf-8?B?dThnQmxaYmpWRytreWNFbmZjemJrNXppSDdtNFBQMzZXNHcxbWdYeGx5RWNo?=
 =?utf-8?B?MVlMcUVWbEN1Yy9FMzBtLzNRM3d4MzBnT3NwK2RYTnlDYXdxMHhoZ2I2RDI3?=
 =?utf-8?B?TFcyTWl5LzJ3cUhuR05tTld0aFEzOGZCZDBwSUFldmRyRVI5Ri9NVzR3ZDhI?=
 =?utf-8?B?bk56cUsyZlF3Zk1KUUtNTXhtWHFiTHY2OHQxWW91M25wRG9uSHJ4Z3NJT2VF?=
 =?utf-8?B?SExJVm5DaE41cFp0eG1sU1JaNUcxN3FmVVJGZVBtT1dtZ21wSndOVWkwZUtM?=
 =?utf-8?B?emhOZE5ZWFoydWc4VE9VaUJXclErQWRGbTI0RXJ6eEdIeU1raXFUVjZaNGdr?=
 =?utf-8?B?TXFTSWsrd3laVkNmcjBWdWxPTG94QmI3cUVJSzlSSXlqUC9TanBKZ0tEV2c0?=
 =?utf-8?B?MmsyWU9RT20wU2RrczdjZHJuZTlEeFpGSWgxNW9vdjhrcnJ3RkFwRHhXQUpx?=
 =?utf-8?B?UVd4Z3orbElyK2IzTnZUSzVlZFVuUE1HRGJIVGJRVnpYTUN5TEVEU1g3SGJr?=
 =?utf-8?B?M2lHM01hejUrdjdMNFR0RWo3UllWQStMSHkzZGZ1ZGtyeHYzL2NjeHgrc3JK?=
 =?utf-8?B?Wnk1SDg4ekFHdXRtQ1VTS0ZlRFU4Z3RxUHBMZ3BRSW5meTRZSFM0TTJGN3M2?=
 =?utf-8?B?Tjh5cWJoeFlQYnJKRW1ETTY3dVF1eWJRcWpBd1RpMVdFYVZOUXVPd2ltMHlu?=
 =?utf-8?B?dTBteDBtdk8xSjU1TmtHMVVZaXRCNXkxdGltbkZ0bnE0d2dCcUJQYnBReGd5?=
 =?utf-8?B?d09FeEVZa3VBK2J0Y2NqN2EwYkFzeHdkY0Q0NXliYXQ5dWtNM3gvUnNYVWZV?=
 =?utf-8?B?SjRuY3grTTdDeXVMYU5wbWpVZlpVUkRocXVESTBhaEVsT3FzZUxkQUFhQjM1?=
 =?utf-8?B?akFFT0ZMMnZSVnIrb0ZGZktSZm1oL3Y5M0tCVWVrcWRMZCtTMzlOeUsxRnY0?=
 =?utf-8?B?cUE0dlN2TzVQY2ZQT29WQ3pOckZ4RHo2M01XNzE4bFFTdTArelJFakRCWlgr?=
 =?utf-8?B?c01WY1RYTmhyc0cyWllvN3BFcm52QzJweXZ3MkJqZHNBbkFPeFU5Zyt4NGdr?=
 =?utf-8?B?Q0VvQzZtT3grcVNzcStGOW5ZNFUzOC83WGhPZ2hJemdHR1FKTDdaclJOK1c0?=
 =?utf-8?B?aGZqcEZpKzVXWlJ4NmlMZFRJTDhRMFQ0ZEUwaVFhMC9FWm0ySExiWkhZT3FC?=
 =?utf-8?B?UGVsa1dvOHNhN1cyblpvUW9jVFJjRDhJZWVhc053Tkp6SGt2dGg2VnhMRjFs?=
 =?utf-8?B?V2FHK0FZQUsxT1pId0Z3eXJ5MWhKRmtyZ1VjSC82RForUUdMUGdLaTNZWHRv?=
 =?utf-8?B?S3FZVzIwYWVCbTB4N2hQTnViUlJvSk5ldm51OFV0bVJSUVZ4b2RaS1BYc0xR?=
 =?utf-8?B?SXBhekFOZ0IyT3VXUmFQYWZvaXBYQ0QvWEtGWTBRd3ZndUN1ekdkSkYxdnpj?=
 =?utf-8?B?UmcrVG5sZ1J6RnNNVmxoVnhYcFZIZG9kUWppeHlJMkgydUtJQlVjZWlJVFR2?=
 =?utf-8?B?ak5ZRDJMQkFOdFYzenZoTEJQSy8zaFFxTjlSR0tVN0hVdGpMMWxyYW5IYjNa?=
 =?utf-8?B?TDRCVWRZd2x6ZENYWDkyTXZUQmJxNWhmNDd0SmZUcUltZnJOYTNKTkJJbnpH?=
 =?utf-8?Q?P5Xxny6K2UWC2ofFhtl7xwWLvXROo2IXFqLCO7c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81418143-bfb3-4420-e66b-08d921169d4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 13:52:06.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rxuBpU3VEn+KMiyeOBsGxA49PKx5oCb9/ABTdAFrR5/Fos2cnPA2VWUwVl2Yu3udiNnnM9uvjdtLHTaNzUSWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 01:28:59PM +0200, Jan Beulich wrote:
> First of all avoid "long" when "int" suffices, i.e. in particular when
> merely conveying error codes. 32-bit values are slightly cheaper to
> deal with on x86, and their processing is at least no more expensive on
> Arm. Where possible use evtchn_port_t for port numbers and unsigned int
> for other unsigned quantities in adjacent code. In evtchn_set_priority()
> eliminate a local variable altogether instead of changing its type.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just one style nit below.

> -long evtchn_bind_vcpu(unsigned int port, unsigned int vcpu_id)
> +int evtchn_bind_vcpu(evtchn_port_t port, unsigned int vcpu_id)
>  {
>      struct domain *d = current->domain;
>      struct evtchn *chn;
> -    long           rc = 0;
> +    int           rc = 0;
                     ^ I think you are missing one space here, other
                       functions in the same file don't align at the *.

Thanks, Roger.

