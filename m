Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7583C3AD077
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144856.266570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHQS-0005aG-01; Fri, 18 Jun 2021 16:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144856.266570; Fri, 18 Jun 2021 16:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHQR-0005Xz-Su; Fri, 18 Jun 2021 16:32:59 +0000
Received: by outflank-mailman (input) for mailman id 144856;
 Fri, 18 Jun 2021 16:32:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luHQR-0005Xt-AS
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:32:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32fb2256-d57b-4bec-8ed5-70b7b3912b47;
 Fri, 18 Jun 2021 16:32:58 +0000 (UTC)
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
X-Inumbo-ID: 32fb2256-d57b-4bec-8ed5-70b7b3912b47
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624033978;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RhpCjIM+Jr/2K4hi89BtEhMrTob0fjsMnDMUig4Y4M8=;
  b=Ljo3MhiDko3jhA/tz0sXV+35XNSCOSbSVg7R9qChmmR+eWHU3Yd0x58S
   cfdONfMyMFLwwxHMz+3jzcouPbpj66B3fRsaZZSlZOaRr/7D0BWT9YN1m
   eMQ5YazM5Ssuis/vOHHZJpo5JG2kTrgO1Uu5sCyqKKVQ8mjK28782RYTr
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jRHSwYPqHe5dyAdq8r2iZRqfnKbD3kBCFPVwqNwxLjfM1UyqNnR3VGhZalkGFIibMVhDGYa3Jw
 auTDUMm21T5N0d97bvdOtHPzUgY5axwt65Y11QPxy8YeFbna67R/OrHly2h3MgUNcllPMbQUvA
 1YzHsY5xMNnYWYdXUTACb7vIlXkxJlDadqMyeJBb4glKp6JF9V58Re1znqqQB3dS4a3rhXlzvN
 Ud6cAUnbLAE5DBjjmsN8A5FhUZbbtDPmK1yMBur94vAPeH5KnDqVMnLQbMNY7NLm8M+2lQ+dJ3
 Zow=
X-SBRS: 5.1
X-MesageID: 46476633
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:95bMk6BG45vN+S3lHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfmSS7/yKmTVQeuxIqLLskNHK9JLjJjVWPGVXgslbnndE422gYytLrWd9dPgE/d
 anl7F6T23KQwVnUi33PAhLY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX252oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iDnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoh8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K0uZkRkIM8jgYJq3MsiFBs/KuZHIMu60vFmLA
 BWNrCY2B4MGmnqNkww1wJUsa6RtndaJGbNfqFNgL3M79D69EoJhnfw//Zv6UvowqhNAKWs19
 60RpiAq4s+OPP+TZgNSdvpEvHHRlAkf3r3QSqvyAPcZd860jT22sXK3Ik=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46476633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlOhcWqabsv5zjy3NnxHNg4KCvoFmRC42h5DvR/RzyX5/3Y3eqJi2pM6sA5zBc+eqlVQ963TxtPz7Mvbx3JZmbl02sayRCs1qcXePi0q+oRWZyXgPinJZWQFEYjvDe1X6/QfF/PYKvIJihVc+y6qnepYEqn1Nhl6rO4xZZNvXccU7I1Zg+n7KPYgImldoPr8aanWaKQPKObCHi+u1FGP6E0kixC41g4mubItrvXLL3KbMGK9A4qHwmsUUXPw7mbgPOW2JGECf/yPJI5L1TfM00TB46QoMIGzyq06As/LaLL+TR59nB93WrJ7hOSGoiTcWGrljRnT/fOQdnf6GVhnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUzAvpRI63xrXKeWz2La8gOULHzD47Sn7nma0MKN2lY=;
 b=oQOnpDNQHTuB/W2IueboM2XqARgZp6xR+gCa6OfHk0BhT7FanYCMMVxiR6ss49y4qlFYShp7UdD0aP3W9jtAUOfp6bTBx67gSEdeK177Hum/MgEXF0vef4703pGdhV7DpMY/l9/BD5qrBvEuDyXg5mCBbNUoHG1qGzR7a3ipjoUcYAm30byJl1IhEREmV56m55DPcg94Y9Q4Ahax8ojGXvmeuYzci81NBxsmaqUMJ/T00NpxI7xGz1ArZW2u0t34jtFRgaEhzCwxjpHTE7MaJobEiVgDlokysL3Yx2imZ9OY6VxDKJ24+B+vbUQWL9ImKfIZ3J+9N1PiISzAmUG+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUzAvpRI63xrXKeWz2La8gOULHzD47Sn7nma0MKN2lY=;
 b=oeu6VZ/Z72j2UBj0MYAHpDMnir99bAUZuRUEWDMCGq6U9TIKSDIbjgoqZrLBa7SszaiLEsf/a4pD0GTvqNVCDTJ8Kub9EZyhJXNwh3vXYcd38BxDs6oGm9IVDZaZN1JlpCnbl7tOozkhOygoDvxOrxaSpK12TkmVuU1V8kTCR8Q=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/AMD: make HT range dynamic for Fam17 and up
Message-ID: <9fdd9760-6de7-be4c-a75b-0d3b1cc10a38@citrix.com>
Date: Fri, 18 Jun 2021 17:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0292.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 036686df-722b-4265-0e53-08d93276b4b4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6271B5E3A8AC989567A0C057BA0D9@SJ0PR03MB6271.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: odc77ZBFa8pxFyPPwANFt1e4i3fsS5RGXzNt6s/he2YPBVNX67QLJoRWN/m9xR7N1VOIi7GBbIULK4WiLcqtv73GliK8N/gMzVRwDHv9aej6yGHkhBSx9uW/7UmVShQ5AjLxgaVqKIsEXLfh/AoVOnBY2n7/uwFz+ZfKWn4aeE8rK6gkZK71/NUKCTHF2N+eRc7FeRz1xuncjb++sR721uWlnV6n6jpusTBUUIjjq2A0wPmtUsZlV3N1Acpjz63s1Db0DisYBabrfbCTZ9/lxO6rR06GXusuU95SaDU0cagUB9L8O9FCiXqueLazIGQExjkfRodVEFKCohw5u1qZlltBh9UCYjQN/exPBMASIu9Te4lbrkkek0I/wxCP3zKhijK4LTOJ+fGu495yyGKGbumbFwpLn8rjWUKi5CZCzTJ6AzKcppd7emucNneAz7CKrwi63c8URh+nNYU4l8e3vGU75mZEd7fmW2gaG2Eed8k50glyozUgE+BJhEOzS6/7H3mvhdwUO5AXYWJqAVJdaWAH+K4Da0v3ul57Hpt4L7lhB7BZBmjS9t9bSQaW/3AWApIuJV6Fsp2z841CXR0ihr5V+UlnidCqzLI4/1SA8XJ7DBawqMEk5+ecW4vpRq/ucZ5jCSpDA5q64hDHHSiAfWtkRKLPqLtVXluC6Tz6TsCUzPVZZwJ5awdFQCUFVez2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(86362001)(110136005)(54906003)(16526019)(316002)(2906002)(478600001)(4326008)(6486002)(5660300002)(38100700002)(26005)(6666004)(53546011)(36756003)(31686004)(8936002)(31696002)(2616005)(956004)(107886003)(66946007)(66476007)(8676002)(66556008)(16576012)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2xLRFU4cTNlT0xaOTF0ZXFVY2FzYlY4OFA4ZldmaVB5WUwxZGVCc0poaUlC?=
 =?utf-8?B?TllUMTZCcFErS0owd1JsWEUrQTV4OW9LSVNSclhzYytLdnZyeFFrYmtCQlFK?=
 =?utf-8?B?YlZDM0krbjV1M1B4bHZlZDVkRmhmazhucHRTN0k3TnBaUXp4REtmUVVuMFpQ?=
 =?utf-8?B?NENGZ2J3RjNPNU13UnJ6NVJpbmdLTWRLY2EvcGxPcDdtd0NPdHVmYTJSQnd0?=
 =?utf-8?B?djVQeGJ3YkVCVkR4bEpLcHhKRE13YWdZODgxQkFCSkdaSVhzaEZKSFFRUE54?=
 =?utf-8?B?YVgycllmNytLbUI4aG9QVnAwb1pDS3diMG9vR0dtWXlEaHBadGxkQ0x3M1BE?=
 =?utf-8?B?KzBHaDNBZWwyeE9BcXk2Y1g3eW9VcnhQeVduRitjQ3BJaXZScFR1ek1KZUlz?=
 =?utf-8?B?SzV6VkNCemYyMXhXbU9LOEZxZ3NaTTlMSWFBOU1FM3JZUVNSRktPVnJyR3M0?=
 =?utf-8?B?UEl6QlJ5eFpkQm9MTlI3R3hWVDk3eVFHcmlhUWVyeGpoT2FtV3NIZ2F6cjgx?=
 =?utf-8?B?b1hmVXdsQU56ZCtNUGxvdm1ndTBnanpRQWVVYlpqeWxQeWNMdU1DcnM3anVj?=
 =?utf-8?B?MFhqVGhwWkJpbk9MUHRLcE5XUVJibDNNQXJON0NPZnZPdVhxZlU5cEpybExq?=
 =?utf-8?B?L0dPSDBTdjhTcDg2WWtrMmQ2ZWJ1dWdLb2ZoUjQ1WjQvSEFFU1Y5OWxEcXg3?=
 =?utf-8?B?N0x5Y3NKSDk0QU5hVk9zUVZwcnJjMzhlKzY1OGpwWkN3WmdIY29SejArNkpp?=
 =?utf-8?B?Z2hqY1Z5RmFLS3hKdnp3VW9laUxEendXa0tXbmx0TWhRZmF2b3hheUFLeUpZ?=
 =?utf-8?B?a1QvODRvcVhsbmpZdmVkbUhuanM0ZHk5bTk2aUlJNjdXdnhPTHJ4OGFnMytm?=
 =?utf-8?B?ckVTMUJialFIQjB4YTZXV1ZMOHBDNmR0UnZYbnJzRXliVU5IaGw5d1VQaTRp?=
 =?utf-8?B?bDlRVzdiaHIxelc4ZGZveCtVcHFCMys3ZzQxRG9nVXQzSDEvTFV6LzBHRllD?=
 =?utf-8?B?Z2F2UUk2clk5ZnZrZkplRHVHR0lPMG5BT0hYQVhNMW5JcXF5UVA3bE5YVnZW?=
 =?utf-8?B?SkU0OUhIb0ZLbXpKdUprdjJtQWR3eHYwZCtHbG9aN2kzUDhTbldqNDJmVlBq?=
 =?utf-8?B?SzBLOGhnV1Njc2RPdmZhamozREU5MmlWNGdKRlo5aEQvMWs5ZUtEYTBhb1U0?=
 =?utf-8?B?dnhwM2x2TUt4TldBa09RdUIzcFh4SUlEK2NjdDhXR09nNG9jMkJlYzYvYS9G?=
 =?utf-8?B?Qk95SWVrNkNJMWs3VGJKSzE3U0gzS3VVN3Bwb2VvTWFnUnMvSEhQVjNhVWMx?=
 =?utf-8?B?STNFNzZjbEczSFFmMGNEUCsvRW4zb2orN005Mnl0MGlHVUVzdk5YZGgxM0xy?=
 =?utf-8?B?d1hZdHp2enBmaFBTQTQwdWNYeXlYM0xadTRERXJjMjJzWlN0UWZlcmZ0RCtD?=
 =?utf-8?B?MXlrbHFQWm9Hd0FUdTEvUDBCbEk2UXRWc2NncjFMRDl1WkJHZmdGdEJWckFO?=
 =?utf-8?B?VDdoU3dkTDI1SWNoK05pbHBGSVlnSFpSOS9Wbm1KN0JnamMvSmJ0ZFNRc3BH?=
 =?utf-8?B?WW1HbzhmbHVvQTRaaDlRc1duaVBoMGtDYW5aZ0lpdC90Ylk4azlvUmlhaUUw?=
 =?utf-8?B?Y2p5L2pIYjhjd0YwYVMvWG0za3ZBc3JyT3lDZDlkejc0dEF3UGJOWTZudnZh?=
 =?utf-8?B?S0x0UEpscGdJYVlVQmJRQWJsdzVMRnF2MmpHS0VhMkRTdm1yYXgwbnBWQ2NP?=
 =?utf-8?Q?tnKzicAQebgrcf13Rsw848Z9XZQFEAhUd3Uu95A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 036686df-722b-4265-0e53-08d93276b4b4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 16:32:46.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wm45pi7k5PIwKuybcI1U898qfWHmqgHTg6+EvrpvtcrjZUzNOjM4l7OGZOvtWjF33C2sV+lgoX2ajtnoLnzf54FFm2YqeWzZb5f9plJ948Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6271
X-OriginatorOrg: citrix.com

On 18/06/2021 17:00, Jan Beulich wrote:
> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
> address range") documentation correctly stated that the range was
> completely fixed. For Fam17 and newer, it lives at the top of physical
> address space, though.
>
> To correctly determine the top of physical address space, we need to
> account for their physical address reduction, hence the calculation of
> paddr_bits also gets adjusted.
>
> While for paddr_bits < 40 the HT range is completely hidden, there's no
> need to suppress the range insertion in that case: It'll just have no
> real meaning.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

Really, this ought to be reported by Igor.=C2=A0 He did all the hard work.

Also, I'd like to get something more formal out of AMD if possible.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -349,13 +349,17 @@ void __init early_cpu_init(void)
> =20
>  	eax =3D cpuid_eax(0x80000000);
>  	if ((eax >> 16) =3D=3D 0x8000 && eax >=3D 0x80000008) {
> +		ebx =3D eax >=3D 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>  		eax =3D cpuid_eax(0x80000008);
> -		paddr_bits =3D eax & 0xff;
> +
> +		paddr_bits =3D (eax & 0xff) - ((ebx >> 6) & 0x3f);

While I can see the attraction of editing paddr_bits, I think it will
break the emulated pagewalk (at least).

With SME active, the address space reduction is only physical addresses
only, not guest physical.=C2=A0 An HVM guest still needs to see the origina=
l
paddr_bits, and the emulated pagewalk needs to use this for reserved bit
calculations.

i.e. under NPT, you can still have a working 2^48 guest physical address
space despite the host physical address space is limited to 2^43 by
encryption being active.

~Andrew


