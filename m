Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109AF4401B3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 20:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218621.379142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgWHI-0002g9-Ii; Fri, 29 Oct 2021 18:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218621.379142; Fri, 29 Oct 2021 18:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgWHI-0002eM-FI; Fri, 29 Oct 2021 18:06:56 +0000
Received: by outflank-mailman (input) for mailman id 218621;
 Fri, 29 Oct 2021 18:06:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3mb=PR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mgWHF-0002eG-TI
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 18:06:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac633acc-6437-42ed-acfe-3bf7d5722788;
 Fri, 29 Oct 2021 18:06:52 +0000 (UTC)
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
X-Inumbo-ID: ac633acc-6437-42ed-acfe-3bf7d5722788
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635530812;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A5WuY3w9P0X75udJidifE1b4JH4cz+UyYg700I+FC5g=;
  b=JoDH9TGYmOBoZEn3aSP5Hdg6eGs7KIMe5TKkGgGOk+zyqroTwPki3YNk
   XE1vKK1AqrurAjCuXAOMbppPjQmAiNyQC2Re9fpMwx5+I5JSZ5NGjgM7g
   o/qyxr81/zJ7k1N/OOvyQSklfnnYkMBQtywBabFgpmeAsQ8kgJHmjiDn2
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Al0/8wIbmijGEfX3bWy2gkfDkCCCwVEnmVXDy5TkJwJjDeakI0BRkW19esKUNCDa7qWusTWy07
 l2dhI0Gq//UQrU82/z0LA7G/QJ6TlxD00aXgWyjMQqtFalKkZ3RhgB5IHmAwwyGn/IoifgVML8
 +oSMWaktcANi+jT7TIGzceJnVeF/ChocVtTtElYJfSNXI0PzVn2bMiNqtxJmiMAvJUJ6gZOB8p
 k8XsxU4/p7WC6f6h9invz/srHXhWQMo6a/Z2xHRzYC4qDY2QiPeJUnMIlikDSuzCgx4g2vmUZI
 57cOfLrjlRFlcCeQps6/lOtw
X-SBRS: 5.1
X-MesageID: 56695960
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uXsC0K4m0t8KD2Dq+jFwQgxRtMrAchMFZxGqfqrLsTDasY5as4F+v
 jNLCD+BPPyNNmShetskOdm0/UsO6MCEzocxHlQ/qSBkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2N8w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 /RujMScbCYSBKjNp7UecxBJORxxMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTQ6iPO
 ptHMVKDajz+UyZFZw4aJqkGwuCDjELlIgF7pRGK8P9fD2/7k1UqjemF3MDuUv6gSNhRn02Yj
 nnb5Gm/CRYfXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVqko9Gph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpQ/0FjZcaYB0R7
 FqIoILqJTV+moCaRifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ht0IWkcd3k6
 3XT9nJm3uRM5SIe//zjpQivvt66mnTeoufZDC3sVWW58hgxWoehY4G5gbQwxacddNjHJrVtU
 X5tpiR/0AzsJc3S/MBuaL9UdF1M2xpjGGeB6bKIN8J4nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpON/tV5p3kPi5TY6NuhXogjxmOMUZmOivp3gGWKJt9zq1zBhEfV8XY
 M/znTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMDh6VqKKnu95I+SIXc19z4/1w
 510YWcBoHLXjnzbMwSaLHdlbbLkR5FkqnwneycrOD6VN7ILOO5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:OUPvE6FY4PRmorvCpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.87,193,1631592000"; 
   d="scan'208";a="56695960"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUWNq74NuKqu/uGY0Fm2tlQ2sBMoHkmAMjRw6B+S5hm25eZOpfAtw5AWaedYsa0jBGWClhKqk0Udj1myb62UZCspzqtrBIvCN7Zd/8ZmLh+eHGz5a+yLEezZ5Rna9xAoMI8BKIBUr0R88DIge14TTj3gUWCNQlx5qRRwNVkuxmwQecI4lpnNPonHGGO+x+oX9th783E+lr36/+RDlnHKxjqBQFjnc58dCR8l+SNfCzVZP9erGlMASqC6vSPgbRqEOet9uyU73LZGt5M7DJYrkzgaWyRjx0myMcN/h6IUwOJYeFtJCdrzUK6JkgO7o2XIXogQFGpyysTwwmtx4U5EKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8tuQP1wCJKzmiVJdXPyz0Wg+Sw6PLxCydlB4nvomCY=;
 b=HLGgIzkZs3XaTpI6RbIbhQofFmW8tZHkRS4L5zdYimcgxAcUgyGL6GBzJwYpx9RNaxd4+3QzU+GXm8Cnmo+mNn48cFzzZ7ifFocKdNWUvCbU3hUrZGAVqDjV1uLgE/C4/UeTvEwZ+A01aztJwh+JoxFdc2JzZqGsQkeLKtd824mAzcTkPqWGN2hXCsB8PlkC/kR9+DlJaYopEQaNZCqioaO6IB1ede8vUnHODDd7DUEn7w+9NUj+KeAVaoBk7KmZS5X0RmwoXfiFQaY5Y9nlZGK2FhgEkpPsiRaqQfj534At+u3X3KrZlskzY30kMgyORYWG+SJSYClJCJLl+gy1/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8tuQP1wCJKzmiVJdXPyz0Wg+Sw6PLxCydlB4nvomCY=;
 b=ZynPOsTHPk/GgxzOYwqz9s5ilarm+bXJmgN/Kg5eiqLl7HBFqY9E/YCgUPwhfFtY9KiOyYZTdDsOUSxP6Q7zGZIGCIYzL4oUBwD0qHtwctNp/m568aIWsR37Dw1Z5owZSk+76g7ZzjUc6C4bVQER3IfGr4en8c1EbQS5xD9qm0Y=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <YXpRzHEawUZEU87h@Air-de-Roger>
 <64788530-a18c-332f-c287-84478a200816@citrix.com>
 <YXqlEQWk1HGNLKq3@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12
Message-ID: <99c451d7-4a7f-8dd0-17f6-92b2153d0afe@citrix.com>
Date: Fri, 29 Oct 2021 19:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YXqlEQWk1HGNLKq3@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ab75cf0-f659-4073-5bff-08d99b06e025
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5743:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5743D14667A7B3E892550E27BA879@SJ0PR03MB5743.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: um9CjU1LAvPrzf9JxInCzOminHBZyfjSrQbHcVzXFtF9hkzKlBdCiJ+m24NVpo+YWBj+Bru4RFSuM89NViD+OOb+fxJUuwVBM5a6VxDN9sbfP1OBsxMc0l3eoub0cWYtmWKoMpD8VqL8NuZLfMhCLCuof681Y4/foxhlCVeOYcd2IQpb9hcDBE3jmMoQZfrun+h1HWXu12/WXGFyrcvkfRkNcuFuhBv2cqfyyUbC4DX9aV9Lyo31dONr6w5biQvdTq+h4OlrwGKoT4gPqG06Ho8O+U4XM0XjNBy4UT/B1Ye7JFD0WIaE05O0iuFN3IxD5v4EDeVPCUxcc4VTUfUVQz9u3aNV8tvUR5NNn0Chr2V1kVz8Sk1vDOTZl/dj69w4W2jBedAm5BEaD/q9Ot9H0Rp65fKt6BdzIvAoNFmLoKWF3rAQxIhcotfeq+z1L2PYD9GcH8GgBhQMEzkQnY8c3FsDOyVXG19hUqJGknKAIJEFzJuixlpXlRLDU3jUb2AdED9FfQo/3zDHFXCYm5EYJxgtfdngwfhYVe2SIN63W24K/FSNdv/SzXDTrngdMxQ8vc8HM/Iu6FomAQRdG4jH/TXqz694OUZKE4oYaM2WhGYq/aaMOwNGvqLG0VnIOjyagRWLuwLgabsMgBihfhCVebxZIdW3FAiVSuZgFHJ2HAjbIVF4++jrhJrICzxRk5+WGKDrwgjNqlmAVthTzi+T9T84d1j+CJDjJiQ1cvZBjyOp/QeTOSGdXS5EN0IUjLnZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6666004)(86362001)(31696002)(4326008)(2616005)(956004)(38100700002)(82960400001)(26005)(508600001)(66476007)(2906002)(66556008)(66946007)(37006003)(36756003)(53546011)(8936002)(6636002)(186003)(6862004)(16576012)(8676002)(54906003)(5660300002)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlhwbVdTQVhIWVRrWGVuWHlJeUhBTlZoN0dPZDFPclg5Z2k5T09VS3dVU2hU?=
 =?utf-8?B?bDF0elNrZ1ovWjJpMkNyYXkyQm1EY1cxTkZmK3NLU3c2N2loaFB3dnV2S0s2?=
 =?utf-8?B?REliNHFVeEVOVTJ2WTFiZERHeGx5MFN1dHYvVE9RVEdCN2dYREppZVE3dnFO?=
 =?utf-8?B?VGtjb3pROVdLTFE5Lzh5K284NWhuMkhyYzhnWUk1QllnTGRLYnc2MEp4c0d3?=
 =?utf-8?B?WkdCeGdvbkhDNTkwM0ExK3BNVnZsWDlLU2VTOU5uYkR3QW1SbE1uWUVXZUEy?=
 =?utf-8?B?TE0xa2F1RG5JcnhTT2RGeFhoV0ErbmNKa0R2WnRkMXdEcWZlNVdIaFBqa2di?=
 =?utf-8?B?S2ZyZkR4bFJObVdnSmxMTzFCZG9wWGRwN2lXam9sYVZlNTVWMnR4K1Awemt2?=
 =?utf-8?B?TkxXWVlOZ1lWTXo5SEIxKzJPSHdvVVhCUDZLbk5UaDFram9PSHYyRlp4SDZm?=
 =?utf-8?B?V29VZXgxNFBVTnR1TlI0VHlQTVY4b0JQQnZOejdVYlVrcHM0N1dseVNlV0pi?=
 =?utf-8?B?bnY1UlVBR2YwSlM1eTFlV0ZLM1Z2WXVyaXc3R2FqSXQrb214UCtXM2JZT3Z4?=
 =?utf-8?B?RzI4Vm9aTk03aEp4Mjd1K1NqdmkrUjZQbEVUU0o1dk51bjRpYTc3OFdNMU1L?=
 =?utf-8?B?WkNIaG54aWN4WEMzeEVGS00rMnF1cUYvbzY0RHBMY0QzZUFlQjltaEtYVW5i?=
 =?utf-8?B?UlNnWC93S0ZRRzFGVUIvRHdUNmxRZXd0R1RZZjJMbzROWHg5TkYwNk1EOHVR?=
 =?utf-8?B?Zmh2Z3hrRUxtU3BraFZvdVRRNVV4dUxoS3FxNnFXbVFoRXdyWDBqa3pyRDRN?=
 =?utf-8?B?cjdVdk83bVE5YWJGd0ZTQ2xtZ0ZzREw0YTM0d211Wk1QL1MvRStyMGVCcUNv?=
 =?utf-8?B?anoxa2ZjcHZXeEpVRlpFcDZHVThEZ1NGNngrMy9vaWNwVnpNVnZKZndhc0hi?=
 =?utf-8?B?TTRVY2orZU5mKzBhaktTRFV1WllnM2hDYXIzcmVvQS8rTkFyaUlqR2xaOFZZ?=
 =?utf-8?B?TTVOTFJMeHN5WEF0TzJyM1UxdVRwTEpaV2pPbHNtMDhCQnk4ekdGdUd6bEJC?=
 =?utf-8?B?S3EwN2dFckZLK2N3MHRsNU8xRnJyUmxNcXRtWFB5NksybEEyaDFvVGl5c0Nt?=
 =?utf-8?B?eFlBMjNtZDdIYk5VWVdHOXBFZzdGQW56QTA2Q2g0czdJVHN1Zk9qdDc4WWlu?=
 =?utf-8?B?U3VMWjNzUGRjckhqYVBSakpRUFdXRXc5cSs1dlIyNVI5R2xCZExIS1ZuNys1?=
 =?utf-8?B?NGE0bUhhY2hJWGkya1BYZitKWE0rMkZHTFdEeGlUU2hXWWZDTm51QVk0TThw?=
 =?utf-8?B?enpaNjd3aUU2K1hnbE44VjBqMnU2QWZNN25BSEVXaGluVFpFbDhFSy92b3Vp?=
 =?utf-8?B?eG00OG9mSHRSeHV4T2ZWMjJIUStuSFdZRzY0K3g1dDBXbkIxbXNNNmlLQXQ2?=
 =?utf-8?B?MXJCRXZpZ1JZTGI0ZEQ0b3BibmV5ZWVwVk5aVGQvd0hCdzFVMERDTjMrVXQw?=
 =?utf-8?B?OGdtZEtnQ25DWHdpRnRVWnZqM0dWd3l5c2x5QkNWS1l5TW43MTd0dDhpWmxE?=
 =?utf-8?B?eTNLV0pwSTlqTkNGU2FFQlAvTjBRZlFkVUltakpLOVNpc05JTXp3NUFrQWYw?=
 =?utf-8?B?Z0tFeTRUSU1JeVJxdjFQRXRuYTlRaXZodFNJbXhhUGMrVmkzM04yTGNRdXg4?=
 =?utf-8?B?U0tHVUFmQWFuRWR3WEszSTd0SkhsZEpSWUd4c0I4aXJHMnpJTzRQZGJuTlZj?=
 =?utf-8?B?SHVFbmhMS0JwK3Q4ZHV5MitPcGFzc2NnSUdGeE0xOG5RTDNCS2JScXo0YU54?=
 =?utf-8?B?VXhpOWZTMEZlZXRqcHZQSHIzanpsQThJZnJiT2dUMmVhUDlBTGw3SndwS0R1?=
 =?utf-8?B?enB4MnZ1VEw4bGJpeUNoUzVOc21BZE9kSDBPRk1DbE9kY2hTS3BCWDNwKzdU?=
 =?utf-8?B?Ykh5QnB5bHluZkZzOWh1aERKbEhhQm1kdXFLM3crM1NpRWcyUUhBWFFmU2pR?=
 =?utf-8?B?VlVjU3Jreis3ekpjNW5qRlNhMGdENGVYZTRwOTI2L2xWZXRSbHpEd21SOElL?=
 =?utf-8?B?cGtxU3R5WS93dHlDTWI2b1MyTC9oOWhOWGZ2dFRnOHF6dmkwT3BRVEhsd2pR?=
 =?utf-8?B?U0NrSDBrWWpGSW1ORnMxN3BLTENyQUx2eCtXMXNIOFNFYnAxWjgxUHZuUGdT?=
 =?utf-8?B?eUphM0oxdjhJZm1LbWxJdGhPN2hpYkFXWGI4QXRhOFRxWVlheXVpWFN5SFlq?=
 =?utf-8?B?ZCszc2t0dDZaRFhJNElQNDI4TTV3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab75cf0-f659-4073-5bff-08d99b06e025
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 18:06:48.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EH69N2NSbbOSTWc9EcmqYYPHH0iB9UXPpagt3k6ty0TMTnGzGgypkIbpR8YA5fQ44j/QB8GWxg5r7pkQhsh+gP79V/LjZcH4Kovrwue6RHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5743
X-OriginatorOrg: citrix.com

On 28/10/2021 14:26, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 28, 2021 at 01:15:13PM +0100, Andrew Cooper wrote:
>> On 28/10/2021 08:31, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Oct 27, 2021 at 09:07:13PM +0100, Andrew Cooper wrote:
>>>> GCC master (nearly version 12) complains:
>>>>
>>>>   hvm.c: In function 'hvm_gsi_eoi':
>>>>   hvm.c:905:10: error: the comparison will always evaluate as 'true' f=
or the
>>>>   address of 'dpci' will never be NULL [-Werror=3Daddress]
>>>>     905 |     if ( !pirq_dpci(pirq) )
>>>>         |          ^
>>>>   In file included from /local/xen.git/xen/include/xen/irq.h:73,
>>>>                    from /local/xen.git/xen/include/xen/pci.h:13,
>>>>                    from /local/xen.git/xen/include/asm/hvm/io.h:22,
>>>>                    from /local/xen.git/xen/include/asm/hvm/domain.h:27=
,
>>>>                    from /local/xen.git/xen/include/asm/domain.h:7,
>>>>                    from /local/xen.git/xen/include/xen/domain.h:8,
>>>>                    from /local/xen.git/xen/include/xen/sched.h:11,
>>>>                    from /local/xen.git/xen/include/xen/event.h:12,
>>>>                    from hvm.c:20:
>>>>   /local/xen.git/xen/include/asm/irq.h:140:34: note: 'dpci' declared h=
ere
>>>>     140 |             struct hvm_pirq_dpci dpci;
>>>>         |                                  ^~~~
>>>>
>>>> The location marker is unhelpfully positioned and upstream may get aro=
und to
>>>> fixing it.  The complaint is intended to be:
>>>>
>>>>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
>>>>                   ^~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>> which is a hint that the code is should be simplified to just:
>>>>
>>>>   if ( !pirq )
>>> I likely need more coffee, but doesn't this exploit how the macro
>>> (pirq_dpci) is currently coded?
>> The way pirq_dpci() is currently coded, this is nonsense, which GCC is
>> now highlighting.
>>
>> It would be a very different thing if the logic said:
>>
>> struct pirq *pirq =3D pirq_info(d, gsi);
>> struct hvm_pirq_dpci *dpci =3D pirq_dpci(pirq);
>>
>> /* Check if GSI is actually mapped. */
>> if ( !dpci )
>> =C2=A0=C2=A0=C2=A0 return;
>>
>> but it doesn't. Getting a non-null pirq pointer from pirq_info(d, gsi)
>> does identify that the GSI is mapped, and the dpci nested structure is
>> not used in this function.=C2=A0 I would expect this property to remain =
true
>> even if we alter the data layout.
> I think we have further assertions that this will be true:
>
>  1. d can only be an HVM domain given the callers of the function.
>  2. The pirq struct is obtained from the list of pirqs owned by d.
>
> In which case it's assured that the pirq will always have a dpci. I
> think it might be better if the check was replaced with:
>
> if ( !is_hvm_domain(d) || !pirq )
> {
>     ASSERT(is_hvm_domain(d));
>     return;
> }
>
> Here Xen cares that pirq is not NULL and that d is an HVM domain
> because hvm_gsi_deassert will assume so.

We're several calls deep in an hvm-named codepath, called exclusively
from logic in arch/x86/hvm/

is_hvm_domain() is far from free, and while I'm in favour of having
suitable sanity checks in appropriate places, I don't even think:

{
=C2=A0=C2=A0=C2=A0 struct pirq *pirq =3D pirq_info(d, gsi);

=C2=A0=C2=A0=C2=A0 ASSERT(is_hvm_domain(d));

=C2=A0=C2=A0=C2=A0 if ( !pirq )
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;
...

would be appropriate in this case.

~Andrew


