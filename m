Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD23264CD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90414.171152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfAz-0001tP-US; Fri, 26 Feb 2021 15:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90414.171152; Fri, 26 Feb 2021 15:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfAz-0001t0-Qm; Fri, 26 Feb 2021 15:37:09 +0000
Received: by outflank-mailman (input) for mailman id 90414;
 Fri, 26 Feb 2021 15:37:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFfAy-0001sv-Hb
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:37:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 462c8f64-9c20-4562-9fc5-e994bec13f18;
 Fri, 26 Feb 2021 15:37:07 +0000 (UTC)
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
X-Inumbo-ID: 462c8f64-9c20-4562-9fc5-e994bec13f18
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614353827;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rcOgp2VM5pLOrUgoppIFmbdPISEsnDb4/3Gx0avKyW8=;
  b=Es7ukiYtg3HdrtEUaOB6noTKYQjr73p2uZOdIXEFd4oZEL+6oVAuIL3+
   HHGb4pisKigi2UflKa0Pa9iL6GPFpweriEYYFX97woPz9jGHFo+o8RWHm
   /bKW1kIYnAmF0G2OJmeU7Jv6qAQgslpaXfIWKonlxF3ILh0LYzFbIfyj4
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: stlaOehzP/NLdjGu6TWfEXkzrdYuz47NRhjCtgnHn7+7P5qWyAk2hdbY8DZz8Qc3wU4ZVkfvhC
 ToJeuM318K1Co/zLPPDBLQzXqHeeUSQzsac9HVNIVr7RtFXtoXg7SK8oh/WpQB67ajqA49rnbL
 JYVFCkANGV4P+glvRkZZCYGE/AGi+LxYiJdgX7J1li/m29nDikEASaMMjsMQYKqbQ6Lx97MKCi
 p2kD8TzJKxsFR0PVNrhee3t6DPrixsbljgSWWpFmqCLXk2KyEJJTOm5mX6a9Yetp4szca+ug3P
 diI=
X-SBRS: 5.2
X-MesageID: 38130836
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38130836"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esYQY1feebpvIO2kIyg6b2SR3Wv3LYdwUJXhi6uVZs6LbJOSZIl9L2CQ820HGO4r7YEgtn9g7w5tXU0aYSnQC5WaS7f9xHP2BtQ8+FQE9/rOf778W+b8eV4r2InLWLNs8acvvYO56Oahs436gZpxAxkBzwVZTVQLNs79O+yAqBBMeHZB1hOoADevF8yMtqGlDEawb73a6E20ktXGdkgwJVhtekQ3h6+ak7jkPtumzP4Y+PpM3EsIgRgl19mtS8rA1JJ8AdXIypnL1Xa4oH7m1xALIHzKyhU+IqR9bJ/HMr2GJwC6GbdCoZh1Vl9H1ljCRVcVZD7PuEs+HjpkNAt/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07E0LxdgpUQqTVTGSukUDX52sFSOCZ0Rir1X2rkAvE0=;
 b=AvqkfzEqS4mIvQHCb0sQfiWK8ZvZwOY6C5baTFlCLPJQhdUbL/ZrdCuGulecc4sPTR2GYQY8lN3au511vFl5Izik8EsxJ+ypZZpjxAXkijj3Ud702sqR9eWlp6g4S9YZhO3Dvp3WAgKgZg9Vn74gqTSF9laeb27PwVBQwoTVzv3MAiI9yRuKkAqSTeliCQi1B0dYktCE8NYZP79EAWi+kYHxlJ2alRBkKxuOaGOON1AWw05oSSFvuKe9XCWgXZLocjhAO+SDflW3SwZVq2Yyw+imoYTW1RhiWgSP77Xm5WF6wDQtp7QE+F4sQU74NIYgksGqLOROchQ21NY349I82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07E0LxdgpUQqTVTGSukUDX52sFSOCZ0Rir1X2rkAvE0=;
 b=Vrw/Yblq4v00OTkilxVAkFiPovdH/p9PNgHq/+x4s6/phpFmZz4gZwV5X4KqVUg8PYsPf7VRdtXIGvN8D+kkL/vQjZuCsGHqr9I7Fd4vmTh/ovfdO5W2UN9RDSpV50w0W45383z8tdp9O5NYWCRtVh6mfQmnxwaENsXa1KcHWU0=
Subject: Re: [PATCH XENSTORE v1 06/10] xenstored: handle port reads correctly
To: Norbert Manthey <nmanthey@amazon.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-7-nmanthey@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a840c4fa-148e-7617-20e5-9b286ace2c40@citrix.com>
Date: Fri, 26 Feb 2021 15:36:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210226144144.9252-7-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c53f4c00-939a-4c5d-0b47-08d8da6c5deb
X-MS-TrafficTypeDiagnostic: BYAPR03MB4487:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4487A6988D3750CBF83540F9BA9D9@BYAPR03MB4487.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8kyqGoflwafsbKdEcc4UBiTS8ADfjJrQFDK7Cn6BNfJgjsvUiwZ35+nQDu+Tlw35GyfNGX3i5+hdQxyq7tsKv5AdFvHi9EeXj8zRvnDHQDUUG8EwOwhxbIVDwyPX8eusAZwsYXSt0Jov+UFfYAXSrtqjPZ0y42aZ3WAEyaPPECrnUwJzSXdRIJpmKDuRmNXjlXVSwJmpOeUDR6Mg1Wej99MxhoFZvRMIpmrzHyGBm+a0VE29rqug7uRyp1y0CXjqIvYzRkiCmyLTsX2LmWdoV2uleHf4vnUtBb72qJPe9ol3+5cUefGxFuEFlBTE3S7k30g9xHWKAFoB9orLj6bsyFQ3acXHHNN/FE4P3R0cyNFI/uthPvlJW7uIzR+2QUwXSFctXnFnztuvl03LeERoEgjsminoURq2D/QEidmqC190Mx/0wX+OC1r9ixveW5vAcDyiLLq0xLUoTWlq71FQEFRYFJIieBlnets6+GOQzTe+6g1EunhZxLa+8OwleOP1P8npnwHB+Dg3lYtCdy1CdT/Ud2k/W1HdMA7SGi3cwpa7l5IbBIyrTpoXqmoIWLXRKDhjya8HSOFMwBGC/gwOxn4Ke+FECpkT6Saz4HO/Hk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(2906002)(4326008)(8676002)(956004)(31686004)(36756003)(478600001)(186003)(26005)(53546011)(8936002)(83380400001)(5660300002)(16526019)(6486002)(86362001)(66476007)(6666004)(316002)(66946007)(31696002)(2616005)(16576012)(66556008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDVlYWJ6TitJeU03NnVlbm9RZmpZVXh5bndUdFJqMGVSYVFtR2k1cWx3dVBl?=
 =?utf-8?B?RzZsSHRES3EyQzVHbXBwUHdVYVBGMTdPcUFpbDFEMGlxV2dFTDd5bGtlcUxw?=
 =?utf-8?B?M1FsN20xQ0ZwY0p6WEVRNGFQdXRkRjJIRE1ZZmlIQVgraFF5bW1jYnV4cUpo?=
 =?utf-8?B?TGM5T2trS0pUQVd5S1dlNVl4VHgrODF4VjNHTmxOc0VWLzQ0WDBNci9Femg4?=
 =?utf-8?B?L2EwTkYwY3g0aGFJVmFyU3l6clVZR2Q5UmUzeXRZU0x2b3duNHpDSVZRVUsx?=
 =?utf-8?B?ZlJyN2NxZGxWV1ZKQkxwczdNT0tSR0QyQ2FaOHBVQTZ4RGJKeGYxdHRyTVBx?=
 =?utf-8?B?UWdoVldIS0FBRkxSY0hEME1JWWpIKzZyRldxTEVMS2F1bHV4eHhFOWVOcDFn?=
 =?utf-8?B?QjhZa2NydVQ1d3VOU0RsRkdhZ3NwVmFKazRxMGFKd24vcFhaNkYwb1VrQzA2?=
 =?utf-8?B?ekZZZmFRb2xjd1hSOVdhZjFTM0NqVy80Q2EyMXNLZWszem5Fci85aXFBRTBo?=
 =?utf-8?B?Y3RSbmNRSHBKc3JsUjJ6NmpSVGh4Qkdxd3prdVMyaU1kTTdLQWJBdjMxQnk1?=
 =?utf-8?B?dk5NQWUyWWZEQytYSEFzaU5Wd3pEcllvQWk3QUZKVUloZDVjdFd2eUhXZUpH?=
 =?utf-8?B?ZjhMWGlob1EzY1AxaE5UdEZxZHBLaW40THZYTnNtak5hWmJzTHdNSjVnK1RG?=
 =?utf-8?B?L1VrWWVKSS9RanV5SVFHNnlSVmIrYnlkdXp6c2ZPQUlqL09GUlFpWUdoUS8x?=
 =?utf-8?B?cTZSQ1pPY0ZOMVpVaGxGd1Uvam5FQUpLRUV3VEdmTEw2N3NWZ21NZEkyME92?=
 =?utf-8?B?ZUQ5R0VXRGU3cTd0VVpZdGZ2RnhOWTBYN0owQks4N3R3OWR0TndXMklhWkhN?=
 =?utf-8?B?TFJEOFVYd1JlS0FUT21OUUNSdEYzSnFoaWMrczJ0OXhVc1AwWEFHSnVPQmVn?=
 =?utf-8?B?WmZGcUdGc2RHSmRsL3hRcnhrQWdJVFNQZGFZVTdBdWF6dVZJbjZTUENFUVJs?=
 =?utf-8?B?L2JZVUN3OUh1U1JOeGtNdUVEczRHRmp5cTVHQnFROFNTblBmNmtZUHF6WjdM?=
 =?utf-8?B?b242SHR1bnVTYVUzSndEek1mdjRPdjQzZ2FGTSswWGJBTmt6YVpBQ0tmWDNy?=
 =?utf-8?B?L0x4L0VwMGljTTFkS3V1eW9wSVVBa2d4WDJHNENBVzRBT2gxOU1PZXdoU0pB?=
 =?utf-8?B?KzB3TUp5bjJrbFVoUklGMUwrRzI4QWdpdFFKZlgrSG5UbUh1UTRyRVFvaWw5?=
 =?utf-8?B?VTFxZVpSWmxvOW9qS2ZzVkVtWmRPVXM0UWxQKy8wVThydXl5dzROTkxXeVpZ?=
 =?utf-8?B?Z2g0T2ptVlp6VDZsd1NJaEFYZDE0NktTeE8zVHVETTQrTDJ5VU9haUdwb2xX?=
 =?utf-8?B?QlhCS2prQWtXUU03QU0vMGw1allYNCtiNEtxTzhDS09FUTVtTG9IcHk1Qkky?=
 =?utf-8?B?TWxscjBCUkN0UVYrbG9ZV1kxY0VoblprZG9uOVpYRlQxS3RCQXcxRVErQW44?=
 =?utf-8?B?S211aERaajdGWlVlVUFnT01zdGpaR1RKc0xxL0F2KzVMMzJsSjJTbXBYUGRw?=
 =?utf-8?B?TkVicmdWbmVHRG0zajFmOGJMYzRDNEg5T0RvckhUdGZ3ak52ZzhHWmpvZi9p?=
 =?utf-8?B?elpRQ1d4ZndRS1p5cjFnRUQ1eTlvajgrU1k0S0JpbUs0dFovVWxHamxIdlAz?=
 =?utf-8?B?cEFOb1FGZW9LanJlOVE3ckljSmJFZzF2OFBKOFVlQzhNT3p1YmlPR1I1OVNj?=
 =?utf-8?Q?38+UkEDL6YozBHNQnHpMSrzUIRUabSOZfR8b8Ah?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c53f4c00-939a-4c5d-0b47-08d8da6c5deb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 15:37:04.1792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sittZcy/VYoTLOsMrefjiUEiVP+eNfLlKkBD+rbOeL7L/uyVRjWfGIM6UJ3dI3R+jvwR+2yDgfyq2BQptq1rxJgLnjmUqYUE0dmOscgQJBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4487
X-OriginatorOrg: citrix.com

On 26/02/2021 14:41, Norbert Manthey wrote:
> The read value could be larger than a signed 32bit integer. As -1 is
> used as error value, we should not rely on using the full 32 bits.
> Hence, when reading the port number, we should make sure we only return
> valid values.
>
> This change sanity checks the input.
> The issue is that the value for the port is
>  1. transmitted as a string, with a fixed amount of digits.
>  2. Next, this string is parsed by a function that can deal with strings
>     representing 64bit integers
>  3. A 64bit integer is returned, and will be truncated to it's lower
>     32bits, resulting in a wrong port number (in case the sender of the
>     string decides to craft a suitable 64bit value).
>
> The value is typically provided by the kernel, which has this value hard
> coded in the proper range. As we use the function strtoul, non-digit
> character are considered as end of the input, and hence do not require
> checking. Therefore, this change only covers the corner case to make
> sure we stay in the 32 bit range.
>
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
>
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Thomas Friebel <friebelt@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

Port numbers are currently limited at 2^17, with easy extension to 2^29
(iirc), but the entire event channel infrastructure would have to
undergo another redesign to get beyond that.

I think we can reasonably make an ABI statement saying that a port
number will never exceed 2^31.  This is already pseudo-encoded in the
evtchn_port_or_error_t mouthful.

~Andrew

