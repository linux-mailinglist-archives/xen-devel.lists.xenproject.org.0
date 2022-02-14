Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF44B4586
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271259.465644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXXo-0001iU-6i; Mon, 14 Feb 2022 09:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271259.465644; Mon, 14 Feb 2022 09:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXXo-0001gf-3d; Mon, 14 Feb 2022 09:21:16 +0000
Received: by outflank-mailman (input) for mailman id 271259;
 Mon, 14 Feb 2022 09:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzps=S5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJXXm-0001gX-GK
 for xen-devel@lists.xen.org; Mon, 14 Feb 2022 09:21:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71580dd5-8d77-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 10:21:12 +0100 (CET)
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
X-Inumbo-ID: 71580dd5-8d77-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644830472;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aTzFiiQ/Jn4gpxeJo7wbZYqOGI8DY5YKZSGkwK9yf3E=;
  b=bwlZ2jrTJKnBFqrY5blVml6aGwncvwm36gci/mr7O96btUcYPF/26WCj
   /Yn+nFKD6M/8TIP2EbS+Snm/Alb6VVri0+LYybDuCN4JHjgKM6dQ+h9mM
   +oXfZD8cYEOPvamRrjqs5pKdfft6uFL/ScgpZHwJKlYHkXgaWEVLheAVc
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Gey/G3I7B7AKDqtOrXYnpGExfc5ruVYSNhH6HxkwxsZLrOFg8aT6yS46iiApK2rQW4OLKBb6/B
 329iQeVszSfQyBdceDvXPmx8fiAYg3bf7x9Pi8tdnPyyB3ONYbaU/owBTms0jZbSqpBUXABT+w
 X3wEF4UBvQUscXzhRr4bGdBRS1WGBSnAFsf5lsKvKNXAbsgzZOaIECDcsvLRfs+/WlEsejC2Do
 VJ+/CQujCv8ZCQ5YUSwb/qNKC0u6syeeacTOvENpzLQ06XNE6HnAoG3xyN7YIkk4Z+BmlvqGdw
 W1Q/Hd2WNiBzFHNsijnpizLm
X-SBRS: 5.1
X-MesageID: 64037046
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZIcwQqiAnmq+K1OeTr7bz4wuX161XBcKZh0ujC45NGQN5FlHY01je
 htvDGuDa/2KZWf0KNtzPYrk9UkDvZDTz9cyT1Zp/n83EXgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0Kv7KgVyZ0BJfJxtZDYT8AQyBZAIFvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2pgVQq6CO
 aL1bxI+NxrjSjdwFmw4M4I8peD0oEXQTTth/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxdcM8aQoRKK6H+jruLJny7/XIMZUra/85ZXbEa7nzJJTkdMDB3i/Kf/2hXWt89jx
 1I8vSAAvbYTqXaRS4fPAS+e+C6FmSMwco8FewEl0z2lxq3R6gefI2ELSD9dddAr3PMLqSwWO
 kyhxI2wW2E22FGBYTfEr+rP82vuUcQABTJaPUc5oR05D84PSW3ZpjbGVZ5dHaG8lbUZ8hmgk
 mnR/EDSa1j+5PPnNplXH3ia2VpARbCTF2bZAzk7uUr/sGtEiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUHrlRQ+H5uqvdaWaG6bKKI3XG327zk0NPgKgKuG0uTKuXGppslcDVj
 L/75loKuc470IqCZq5reYOhY/nGPoC7fekJosv8N4IUCrAoLVfv1Hg3OSa4gjC8+GBxwPpXE
 crKLq6R4YMyVP0PIMyeHLxGj9fGB0kWmAvueHwM50r7gOTOPCbPEd/o8jKmN4gE0U9Nmy2Mm
 /53PMqW0RRPFur4Zyjc64kIKl4Wa3M8APjLRwZ/L4Zv+yJqRzMsDeH/27Qkd9A3lqhZjL6Qr
 Hq8RlVZ2Bz0gniecVeGbXVqabXOW5djrC1kYXxwbAjwg3VzM5yy6Ko/docseeV1/uJU0vMpH
 eIOfN+NA6oTR22fqSgdd5T0sKdraA+v2VCVJyOgbTVmJ8xgSgXF98XKZAzq8CVSXCO7udFn+
 ++r1x/BQIpFTANnVZ6EZPWqxlK3nH4chOMtABeYfogNIB3hqdE4JTbwg/k7J9A3BS/CnjbKh
 RyLBRo4pPXWp9Nn+tf+mq3Z/ZyiFPFzHxQGEjCDv6q2LyTT4kGq3ZREDLSTZTnYWW75pPeia
 OFSw62uOfELhg8X4Y91ErItxqMi/dr/4bRdy108TnnMal2qDJJmI2WHgpYT5vEcmOcBtFvkQ
 F+L9/lbJa6NaZHsH1MmLQY4aviOiKMPkT7I4PVpeEj36UebJlZcvZm+6/VUtBFgEQ==
IronPort-HdrOrdr: A9a23:LA/8KqhMGswgAxB/Hj8Oz+ldrXBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUZqFh5dL5iUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHkondotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64037046"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVb2oEWwpzSUXb5Ff6eyVSz3jZJDqlq8GyCSFlt++ZobBzVaKQ02a+pH54lS6b4AltcEafBXKNGQUZ3xot3T9/cMT28T2qjcfBAGNRgVFyPjzJGtHd1yxHAvt0DFgWzrUyk9NKXh35DWOW1Yv94swlTHgpkWRcsDzDBtfDgvm4lxEUkE4uUkyhi9ffDoSb8JpFSOElkXVG5Yu1HkZ44Lz7GhtiowosazwXJ0Fc7JZFsdB+AtBZxI/l+ooKJW3lRtYnomC3jYSDjJ4n7XrKUPDzZZupU16xqwH3j0L5VCrzUbKM6o7xi74O3+MSAuan0i52Q4XcNnSkgpoyx6CbG4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e93GEiZLikR/MygTaIWrH1FCGnuc38AdZzBR5cJbqN4=;
 b=a8OEpOJJUtuUQtpyrh15TknoTCQ24c3KAQU2zZ3Ov3V7nA9eiXTe4I26wbwZrB6uM/9dxBOpipN3iw0GwspBdmu69DqrGKh8Rg/rGzeesEFPBzEUFaIZz2t8dg4q7AFfmtXOwt8UDLHSD2SnKG7v6dqCTeYF1VwJ4qP+CHI2haYgz1/QnctKs6qqKoytQeH8iS5fj8lReBOfGytII78T4hhk+994xyNgMvgu6TlMAtOTaH+Mivmji3Toux2e+BTEcKI+ArvNLiCdMHzhpHlDtjamnXXwFkiOhq3LsID6N3h05tlz2RA5EnYuGPGZOnqKTyThdKPxUf7aHhHXJJb40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e93GEiZLikR/MygTaIWrH1FCGnuc38AdZzBR5cJbqN4=;
 b=QsHrCuEPSax46vOMSrjO9dfKKT8/Scyq0o14aIW98c4JRq2hWU6uVTJHyNYmdOSw1Iyo3vyjqgui+ByZH6FhutINUogsh6LHjEubxv0AfzvF94xapgwnAwy4JyFrS4drz4gEfrUyhm3sqAmO8i8e0sZKn/T5hkg/j5Nzs2My1Gk=
Date: Mon, 14 Feb 2022 10:21:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Dr. Greg" <greg@enjellic.com>
CC: <xen-devel@lists.xen.org>
Subject: Re: IGD pass-through failures since 4.10.
Message-ID: <Ygoe/e+UzAtHe3Ac@Air-de-Roger>
References: <20220214060011.GA24404@wind.enjellic.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214060011.GA24404@wind.enjellic.com>
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a437ae6-44bc-43be-a4f9-08d9ef9b537f
X-MS-TrafficTypeDiagnostic: BN9PR03MB6043:EE_
X-Microsoft-Antispam-PRVS: <BN9PR03MB60430AE75FED0AFD10C3AAFB8F339@BN9PR03MB6043.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lRMDMOLVl6auWS5RPwSSow/ao4iWgBUgShOc5sGGjOljk3Hyccbbs3krS6gCBOHQDkJK1kvv78Axvyko1Me2WivhsyHhc2+gp9oqNy0Bhj2IOpOaM9eRqjjwdXnfBXM0K0dcRnzP8zrvvA5wFw7qtNbJqycWvpR1kumgiBUc0uzkFM2iY2tUqgwUDtXO0yW+BNrnCDXsPi9Eo/7TjbBMgv53mk6hKfrlr+xQwNaSv96lcyyiPlT2f41TaElGb0FBGEgExJiQM8S+yKZxkZO+1S+PueL7Tb9GwfHN54GUOyrjKr5CPDUzBw00v8mCfj+PAXKeLMAwHeQLkLTobZqyPNEZj+s54zwOochs3l03kW2CgoLLbGleWrIhtu5PvajQc0RUImvGbhM4/7RMxLP4dXwz8xgvUaI+SEq7p1+KVDZcZ9P2Mu7nLzXO3i5eAfP8lcr6FJsIxZqpPzPibD3I7dRXBEP18IW9O7xrHE088Vlf8KzoT1oOXLHiIVd2hRkqRGBh/EDYS1KJUGBIU5VA6romGSR12N2Tb42EGlaTGExMQN3A2xJaHLdn1kHR4EQnWAwrKNIdeN7D4N3OFvolJ0VqpRSZ3s2WdN/Wg9INHUraiyAySjuT0Ebl8XQ0qvitQOF6G+uPn0TG5fo6jqkBEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(66946007)(66556008)(26005)(8676002)(66476007)(9686003)(6512007)(33716001)(508600001)(6916009)(6486002)(86362001)(6666004)(316002)(82960400001)(186003)(83380400001)(38100700002)(4326008)(8936002)(85182001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU4vN2VJWVdpWWYzZ044Mm5CTElLTWdwbmxPODdEVVB2MS9mM3NFc1IrUmNn?=
 =?utf-8?B?Y0k1ODlrZVQyU1ZET0ZiSXV0L2xybVZJTDZxU2ZsQkVaN0Rwa1dPQXB4czRh?=
 =?utf-8?B?K1B6Z25rNWhNOU4yOUJBUzRha3gvUFc1V1VpanVNbk1vN2xaVGNpZnlYeCt2?=
 =?utf-8?B?bWt5OGJiLzd5a2c4d2QySUpua3pNbjViektJY0o4OGJVS000U25Xd3lVdkFs?=
 =?utf-8?B?amF6UXYxTmJ5VlRoRmw5eGs5VExURDY3NkZBY2N2NE9DYTRRTHB0aHVzbUNq?=
 =?utf-8?B?cVIwamRLOWZTU0Z0czF0ZDY5akM1T0dqNFZlY2M4V3dOUnF3K3J5YzJvQWlF?=
 =?utf-8?B?Q1RoTG5ReHZ0elhiOTE4SzF6Wm5UTVV5cTZJcVlYbDduR0tUb0prQ2s2c1U1?=
 =?utf-8?B?V082ZXlZZGYyYUVzSmRoYVV6c2oyU21sRDQ3WUt4YlJwZEJWR1V1aENXT0Q5?=
 =?utf-8?B?QWhkNzhDaUEwQytkT2NGWXFxdUppUjZDOXQvcEl3ZkhTbkNYYTAwend5bEFG?=
 =?utf-8?B?L3RmM3M5c1J6aHdYNnkzQVZYeW8xY0ZMcGVJaVRvQzNXcityQTFEdzBUcSt6?=
 =?utf-8?B?YzNjVEUrWnVMVjFRVU9jNDZRWUtxdEhQR0xsRFBNVU15N2phSVlPOG1PNFBX?=
 =?utf-8?B?Z3VCelhsVUJIdTM0d09uMkc2MEc1VjUwZHdCRGx0VG1ubktvQUViQ25henN3?=
 =?utf-8?B?MUw2ODdEb2Y3R3BITDQwVU5pS2NUTzhmL1NHdFlZbFBuT29QK0ZrTS9WRFlu?=
 =?utf-8?B?cFBxNUNBMGQzanhCUnBiV1VDcmNTazhaUXVIQ1dncWVweVVFUjJVUWh0VlFV?=
 =?utf-8?B?cnBxMGRuSTBIb1huMkpIcXpmMWZsWlhoeG1FdDhIWFZ5UjlTMEFsa1hrU1lq?=
 =?utf-8?B?bDROVkN4Z3VlcnI2M1kzR1RWRDZTdGg1SXhweHJkTURiUGM2emxrNDVqOXA4?=
 =?utf-8?B?SU9XY2hINk5QOFRCY3pQend4dmJZanJ5Y3IrMGdpdlVkU0dtQTZuVTJiVzcw?=
 =?utf-8?B?NHhmeEdQUEM5OG5LbUpNaTVEL0dDNEo5OHhSWEQwSGtPa0NuKzRiYjU1bDdv?=
 =?utf-8?B?VUZGOGVNVzFRSHY4R1NqSUk0d21ieUdaTUdYbk9EOUV3cGxBeEFHSy9XNWtz?=
 =?utf-8?B?TzJMSkJZc3JiQVVSeXhuUVNDKzRBYVpDaEZPa1I4U3I4dkhTMWU2T1h4UHFr?=
 =?utf-8?B?cU9KYys5WmJScjFhREZSVXdHVEJMNU9GbWdnY2hyTHRIUTdzRHFTMXZiWmYy?=
 =?utf-8?B?OGg1R1hUTUo3c25CS1dCQUlFaVM4azIvS0RsNFVKNWFzK21rMnBDQkE0TGxI?=
 =?utf-8?B?aUxYRjE5MnJDREJjbmVPODFoUHhpdlBySHJGL2Rxamp5WFlmU24rRnB0WnFi?=
 =?utf-8?B?ZXU3UGZ6UkQ3d1drS3JGNnd1Nm42cmlCK3pmc1Y1VlRldEEzekwrcWlYK3c0?=
 =?utf-8?B?KzFmTnRlLy9TTUNSTXZhZDFSR1BDY0t1TzhTb1JxcVJyMHc3SkZGRTdTY0NY?=
 =?utf-8?B?d1hJM2lrOW1YUzFsczRxMHNEVGhlbjh2dERnaGJ6dVNBS1ZiWU5BWXAxK3E1?=
 =?utf-8?B?MFRNM2dlRWpJb21WOUhOUHJqL0dvRHZjMW9GL2tUbVhKS0FSZE1sZUN6Qndt?=
 =?utf-8?B?YldZZ3JOQ3RIREc2bVF2QXloNzB0YmNOaUFCK1B5b0tWWnNJSkhENHI5M1hv?=
 =?utf-8?B?T09DMXBRNVBUSXI2ejRaQ0p0ZkhRQ2FZWHRaMFBTS3Vodk95S3dYYnZNU3JM?=
 =?utf-8?B?aU12S1p6MnNxUTVuV1NrNVR2Q2NTRWNtVG8rTGkyejFFL010K0VxMDUvVStR?=
 =?utf-8?B?U2dNMW1sWlJ6S2ZoVTlXYWhjaWJEYVJUUTFLOEErTDZNdEtaUUloOGFXZUNP?=
 =?utf-8?B?Zmp3MWJNanFFaHRRNlp6bTNyZmVRK0sxOGdWRURZRi9sTGJjcEVIenR1WXZK?=
 =?utf-8?B?TnFiSFgrekprRTdjWVV5Y1dWZ05wLzczcURKSFdObTR2SHdtN0I2MUhZOGxy?=
 =?utf-8?B?SnBaSjNkK1lWc3FwZlpyUW9ZWFV5aGs1aVc5N2Nud3RKN2J6KzVMelM1VWJQ?=
 =?utf-8?B?WW5xTlltb2ZyR0ZoTDgvajdaVDQxcEZldkJpZVpwTDM4Z2N0VkpKaHJIU1hN?=
 =?utf-8?B?cVdIWTY5NjJoSE1QSlMxQjBmUlM3eDk4R0twd3lZQWR4YmhLY09GSUVPSVFW?=
 =?utf-8?Q?yjOccrQsrVoYyN9CbdnKZ5Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a437ae6-44bc-43be-a4f9-08d9ef9b537f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:21:05.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbZynhqpaMz7PuS5YzvflRfumsxnb8XhEe0ZhFs0hvRtfFNU0k0OHUx2Mot70jmCv7wneI2EwJhHbcDicjoWAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6043
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 12:00:11AM -0600, Dr. Greg wrote:
> Good morning, I hope the week is starting well for everyone.
> 
> We've made extensive use of PCI based graphics pass through for many
> years, since around Xen 4.2.  In fact, we maintained a set of patches
> for ATI cards against qemu-traditional that have seen a lot of
> downloads from our FTP site.
> 
> We ended up switching to IGD based graphics a couple of years ago and
> built a stack on top of Xen 4.10 using qemu-traditional.  That
> coincided with our transition from Windows 7 to Windows 10.
> 
> We've never enjoyed anywhere near the stability with IGD/Windows-10
> that we had with the ATI/Windows-7 desktops, ie. we see fairly
> frequent crashes, lockups, reduced performance etc.  The ATI/Windows-y
> desktops were almost astonishingly reliable, ie. hundreds of
> consecutive Windows VM boot/passthrough cycles.
> 
> In order to try and address this issue we set out to upgrade our
> workstation infrastructure.  Unfortunately we haven't found anything
> that has worked post 4.10.
> 
> To be precise, 4.11 with qemu-traditional works, but upon exit from
> the virtual machine, to which the graphics adapter and USB controller
> are passed through to, both the USB controller and the graphics
> controller cannot be re-initialized and re-attached to the Dom0
> instance.
> 
> It appears to be a problem with mapping interrupts back to dom0 given
> that we see the following:
> 
> Feb 10 08:16:05 hostname kernel: xhci_hcd 0000:00:14.0: xen map irq failed -19 for 32752 domain
> 
> Feb 10 08:16:05 hostname kernel: i915 0000:00:02.0: xen map irq failed -19 for 32752 domain
> 
> Feb 10 08:16:12 hostname kernel: xhci_hcd 0000:00:14.0: Error while assigning device slot ID

Are you testing with an hypervisor with debug enabled? If not, please
build one and see if there are any messages in Xen dmesg also as a
result of the error (uisng `xl dmesg` if you don't have a serial
attached to the box). Posting full Linux and Xen dmesgs (Xen build
with debug=y) could also help.

PHYSDEVOP_map_pirq is failing but without further information it's
impossible to limit the scope of the issue (and whether the issue is
with PHYSDEVOP_map_pirq or some previous operation).

Thanks, Roger.

