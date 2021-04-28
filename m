Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A2036D621
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 13:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119239.225661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbi5T-0003Hg-67; Wed, 28 Apr 2021 11:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119239.225661; Wed, 28 Apr 2021 11:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbi5T-0003HH-2t; Wed, 28 Apr 2021 11:10:35 +0000
Received: by outflank-mailman (input) for mailman id 119239;
 Wed, 28 Apr 2021 11:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8fo=JZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbi5R-0003HC-Fv
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 11:10:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecbaf8c1-15ec-47c2-9c08-6382afc4204e;
 Wed, 28 Apr 2021 11:10:32 +0000 (UTC)
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
X-Inumbo-ID: ecbaf8c1-15ec-47c2-9c08-6382afc4204e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619608232;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BJVMstSmdT9cBJonoVkZZzlvQ+PVVaGm1iirV4qXqBY=;
  b=WPPYrIFTOzluqYNgKbJ0ipnGcvD1AZnMMYc0z9+ls2WVbYVwgaSB0fZl
   qsr/FEm4Q4BIzEMPfXwP5/eunF4804eF/3lxUVJW3Rm+he4gN7WnHuTs9
   va2T4eEOYoN0Kfc5zDSAyFaQmyPrdoRbHxDNhszD4mYMH2PrRNayWovX4
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5DV938n/vaVp8JZoFAnaL+dwDy0ut0DOLIxi8KMCVvSyUfl1aS9glQqLLR58wAiJecKw3bxFQq
 a1ijpR1+lCUe+1+h7zPjsq+McfqFaq2sa11MpqORq+E9mMKgYmKhh6Ls4tcC/eelVJH0go9nIC
 q1U4ErRF/rwpn0nnGmgxP5SGOk6Iolz6Zp4UaXRIK3RshcxWvtPbfW4DANxPxxZrPrsMoG4fJT
 GsmfpgZyHcsKAg5F1OOh+T92usoESRe9VuSgmuGTld3Y8nOMi3UcCBckrNJ4XpSs7U/Qk+vMzi
 rG0=
X-SBRS: 5.1
X-MesageID: 42606162
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gI2lDKkgWeh7azk2/LTMUHN6LsbpDfOnj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW57LLA+E4
 eR4dcCgjKmd2geYMjTPAh6Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLA9n67Ek7G
 TDjkjF9ryu2svLtiP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUbZ5SspzYwydvfkWoCsN
 6JmBs4OtQ21nW5RBDJnTLI+y3NlAkj8GXjz1jwuwqQneXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znms7UeNham9azhQmkW5unYkm+II5kYvN7c2U7NNsZcZuHpcDZZoJlOI1KkcDO
 JsAMvAjcwmFG+yUnaxhBgK/PWRRHgpWj+JTk8e0/blqQR+rTRSyksVw9EnhXEQ9J4xYIks3Z
 W1Do1Y0J5JVcMYdqR7GaMoRta2EHXERVb2PHuVOkmPLtBJB1v977rMpJkl7uCjf5IFiLM0hZ
 T6SVtd8Uo/YVjnB8Gi1IBCmyq9DlmVbHDI8IVz9pJ5srrzSP7AKiuYUm0jlMOmvrE2HtDbc+
 zbAuMUP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5urWN4zRsPDBevq7HsusLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmPl+5ZdF7Xb4vgzxIABOpYkiHlRtX2JouWwbRFSuK0/e0
 VzZJn9lLmgmGWw9WHUq0VlUyAtSnp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1taR8PSGw
 hPmkRv9cuMXtut7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KZo6RqprF0HuGwZukQhn7E
 dPATV0B3P3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAG7vsEgRnwSWha0Ss6JiQMSRz5Z72
 cBsZM3sf6lo3KCOGE/iOM3PBlnc2KMGo9LCwyDecFpgLzxQRpxSm2LnDSerBk2dgPRhgMvr1
 2kCRfRVeDAA1JbtHwd9qrx6lt7el+QeF9KZmlgvZdwEnnHvXhPwfaGD5DDple5Wx8n+KUwIT
 vFaTwdLkdVy9e72AW8tRyCGX8lr69edND1PfAGSfX+y3mtIIqHmeU6BPdS5o9iL82rmPQMS/
 ijdwicKy7YB+sl1xeOnGssPDB5pRAf4KrV8SygyFL9+nExAfDfegs7A54aJsyR9GjiSbKj1o
 5jgdc8oOu3NSHQZ7e9uNfqRg8GDimWh2i8C9wMg9Rzm4kZsbNoBZnVUTfSzhh8rV4DBfaxsH
 lbebhx5bDKB5RmcMMTcR9I51ZBrqX5EGIb9ijNRtIkdV4jj3XnL8qEzrrBp70oGFCArmLLSB
 Ci2hwY2/fORC2Y07EGT4o2PGRNcUA5gU4Ssd+qRsn1CA+wcftE80f/GnihcKVFQKzAPbkLtB
 5175WpmOCQHhCIlDz4jH9eIqhU9XygTt73KAWQGfRQ+9j/AG+yuMKRkYaOpQaybyC6ZUQejZ
 BEckJVTv0rsEhSsKQHlg6oSqL2pUo5lUB5+j8PrC+05rSb
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42606162"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOEz9NRafsamUc4LN1W0I6pjHgqsQNf5twiVg+F3uCPhDrLvh8vhciYgTyFclh40xjsj1C2FTk8mg9hu7sv6SUv/Ewf6dDpLZgQ7VgfhHaOQ2vLuLH5rOcBaPnW6DcjxlwrrgR6X64Xd9q33KfxhHUERsc5OQSiQc+F55k/gtKhDk1RVWGdwZ9+SPPbc8AlWgNJELjIud9BWGMqAJgoOoAxfRsVr4zhJNOEwufjJRTqw1Syw7CMIAbQ4PhVy8BuV2jcmRhS9NG2AaLOsRTWje8ShACyFIRNOM97HLIxyMJju9+Bp2vPUvwyxpHL/TvurMSW4Ozq2+oUA8ZUonQswTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nF5Z5XFVP+34JlH6bPaU+/FlpvrsSKOTrIb97eHbun8=;
 b=O2ataJVEtkQJM+/heBU+8KmPFAk9mfDmXaYuUtr4KekpDvDTy3313rI5NevIf0ZySEed8QkIGJL0jKaWEPyfDw1tyw03wLWZZ0l8U25QLKmprnv7RMfmmFcYqQsiEIBIR5JtwqUk5n6EHaYmy6qacFEKQAPKDniDCRIx4F+APjHbAW+B/4iZc/6qre/jCAaydhOK90mXXbD+LG737agcLHFctzoy0azDeMhuGzeiQh22I52vl4vWE1SUUHXq7usBgIOLbkH1zT7BPKLAr2z/MdVPtqxrOAmPAJl1+91Y7rj4P/oWbO3ASGUsKvbkDG6UXm3hc0LvRp6ZXbRVmjkPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nF5Z5XFVP+34JlH6bPaU+/FlpvrsSKOTrIb97eHbun8=;
 b=I36W5zw9JkGSfBbx8ughpCemxa1j3pa5lAq/iXpCZqwtvZBWad0nE2AJiq24D6rYZqvvUoiRvYxYSHikzw2vAdRtBt1+H/scgOEjxrBdSO5xQERvAow1mK6Iu8LLnk+jl9UHUc0J6PFahGw9JGkUR2KfLqwxRIjuOxm6en4zCrU=
Subject: Re: obtain a list of granttable PFNs from toolstack
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20210428095049.14a8272b.olaf@aepfle.de>
 <8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
 <20210428121701.3272b369.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <244fb189-c740-7625-3242-568d82bc394c@citrix.com>
Date: Wed, 28 Apr 2021 12:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210428121701.3272b369.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6b0c6e-a274-4bee-3aa8-08d90a363433
X-MS-TrafficTypeDiagnostic: BYAPR03MB4120:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4120C29B59501B3DA80D1FC3BA409@BYAPR03MB4120.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eubCEpifcQpHJNsFvSy7EpyX6Ekad2zgrh8cFcvzmXnkh6VINvhZkSsNksys57iTpbShEjS7MUgg2D4qK8JQjyLs+QxQB5KTDsqwPEsOXLnh8sutRAOuGpBt7ij5lN4pbO9Kf+bm1oLuBSLuyAOyL4hzaO42W+roEAXyrr5270VXLdnRfHykDH/moq1068K+VHw2ap1mbx9qonHtFnckJ47opgLyJAfUH4L/eJnZV7H7xn4wia0YczJFRPSUxx1ZfmAZlSl46mqlB9X9S7HgR8mQ6b48d8CQy/CA+wEKlIez3nPMSRUjQ0FP2qvtQKVvqG3PbTLWaZooLve55hG06OMNqw389eTdlS+FahzzRI+++wfJl6HL3hzsNbtiAvudFQJ5lIwOz8RZ91ExNfVnRweUAd0lFvGIJacbnpP7UXWhLq0OenKhb+HcXIaPiVFbzbVTJUizKM3SBh1eQ1GfjaBJCqMp8OWcQuu4Du4FDTiTElMH6yu7mH/9OasVz45NrBTrJoXxWmKM8HuMR3VLSBQzt3wANASxl/BwZK9euGI4TQsPccZ0BzZ2Sk9Li4mIAu1N+f4cEWAK5mdW0QvzqgsnnS1qdiY9EdyhhZO2iZaYQ7fFrR+OuHwOZ8F5+HfvyOhULS/z05ktcjmPwmCp8A46dYrAw5sFS2N9w/QcJoH72MJh9Mjil80lEhUktj9f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(31686004)(478600001)(53546011)(316002)(8936002)(8676002)(956004)(6486002)(16576012)(66476007)(5660300002)(4326008)(2616005)(38100700002)(4744005)(26005)(83380400001)(2906002)(110136005)(6666004)(186003)(31696002)(66946007)(36756003)(16526019)(86362001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?Ned07F3XfQlyKQ6h7oLMpoImlnxOVhYIsrl1l5lisoKlTzjntcvDef49?=
 =?Windows-1252?Q?MhiKP0hpscNcKnzVSKVSuRmLAKmubOJniYbMemiSsJKE13Y5KcMJPTsZ?=
 =?Windows-1252?Q?sn/MO6CyotJ0snxm6v15Gh6abplQE6DOTCytVmROwxwlaM3cEraBfbNG?=
 =?Windows-1252?Q?z6w12rBrXO86tt/k97dpewhss7MsWhNTvKr+J/od1R6ccCnqswIzwIrT?=
 =?Windows-1252?Q?7Gazi3ltJj5wbKo2MT2wjJiSdPkg8LbOCuLbATDSdHynEKx1Io3wKXx3?=
 =?Windows-1252?Q?/6heBzMOgSZn8jaJE7CHqJ2OqBE2kVwAIaVr4vCboOUnJpi8ATkuzm5R?=
 =?Windows-1252?Q?r7aofHv3RkhpVRy+p5XJu8JwGs97szQ0DaD01XUnj/mZHme85rD3u/QP?=
 =?Windows-1252?Q?mfabkappuCkzAQSa5L7f5fPY+NDyOca7VRepkCafPv20pdkVuJHHbdnJ?=
 =?Windows-1252?Q?Vj4hV62BO6/83SS8vdVwRrn2KMnzowDm/LySYzxtn1ghfFnALfSDAnYB?=
 =?Windows-1252?Q?ah9KH0EzK7DFYwKm65dD7w0LysC5yaZ7ozguPpA88aYn63eN4CvvGOtp?=
 =?Windows-1252?Q?rOy45njK7JuYDdhxdv+HV5tY6V0JHmQ5PacBkpi8ZxjxknNrQzCWTgFJ?=
 =?Windows-1252?Q?OQVXkOZqcHDqwuez047XU5fM0vWQMCo/YVbToWVqJic3DZQZty54xI8j?=
 =?Windows-1252?Q?ubtzVFxYC9nssNEmneB15yoCXZoEsWsuyNTg3KLCO3HjCh6hPZiPTH5a?=
 =?Windows-1252?Q?WMwtiw67AacMwJVemhAQL0Pi08DJJGPbW6Rs71hleLPrGdtl8vBqiFtj?=
 =?Windows-1252?Q?esv18DBJWPVYe08WZo+EyFR9SX2A0dxVyiWzVQ45E59aVeSoymy+kZky?=
 =?Windows-1252?Q?ddHtMrWtTKejsAYi8TCvkdQsd5waen+1ei60YLQf8UNWclWKQzR0U3Qv?=
 =?Windows-1252?Q?CEQL7dfLGZ11pzdftAACQbFtTA8X9bR/yZ2rGWWP/gwWGERNCbs2LLJz?=
 =?Windows-1252?Q?J9C/EGySyAauWuRYr0WIgtwq1Stbo4Tx2Vp3NDWc5tp/OQTksYycERZ6?=
 =?Windows-1252?Q?b3yWjOrGankma67q8GbbsDJb55wlgMxQHOwQI5fSlWrhpA33eJQqyqIq?=
 =?Windows-1252?Q?gMwnrH/CwyrXfTnJ7s0BlBdyyyCPB2e968zP9Z3qENhwTAa7Qcq78zrv?=
 =?Windows-1252?Q?yxDhjx8gXY4pPtPA7LuZqrdXn7iGwxNV2/HcUYZPFvXaQRt4wXBPM1FW?=
 =?Windows-1252?Q?gzwz3piigtToz6r/3WTovlWTURNE0qEwBP+M0Zr72vEWaEKzv5/392GZ?=
 =?Windows-1252?Q?7ai+msbTl7Y77RWAWPLTRMGOENOr9W7l8sjTmEPk6kI9P3jlbkM2EMYI?=
 =?Windows-1252?Q?LvYmBBCee1QZrQztEjmwvRy4c5efC39kb/VFeZbe45gobadTOcnkBkf/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6b0c6e-a274-4bee-3aa8-08d90a363433
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 11:10:17.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw4YXXeo6nl5J7DhlguUpiIh4tXHNv6j3ByWgs5KCtBYOzWpqA1yAewdoaSJA9HtYj0QG/5G65otKCP3sA8YfL3rMa4for413SWtyyblJYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4120
X-OriginatorOrg: citrix.com

On 28/04/2021 11:17, Olaf Hering wrote:
> Am Wed, 28 Apr 2021 11:49:59 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
>
>> On 28.04.2021 09:50, Olaf Hering wrote:
>>> Is there an API to get a list of PFNs which are currently being active in the grant table for a given domid?  
>> Do you really mean PFNs?
> The save/restore code uses the term "pfn" to refer to page indices from the domU point of view. Since I usually just follow the HVM code paths, the term might indeed be incorrect for PV.

pfn's is correct here.  The migration logic tracks dirty pages in the
same address space as Xen's logdirty bitmap.

For HVM guests, this is ==gfn.

For PV guests, this is the guest's logical idea of its physmap layout,
as written in the M2P, and specifically not mfn/gfn's.

~Andrew

