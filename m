Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F039A3BBA8C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150025.277452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LII-0001H4-GO; Mon, 05 Jul 2021 09:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150025.277452; Mon, 05 Jul 2021 09:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LII-0001EX-DG; Mon, 05 Jul 2021 09:53:38 +0000
Received: by outflank-mailman (input) for mailman id 150025;
 Mon, 05 Jul 2021 09:53:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0LIG-0001EO-9s
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:53:36 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd028cb6-dd76-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 09:53:35 +0000 (UTC)
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
X-Inumbo-ID: dd028cb6-dd76-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625478815;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PYPDtw6MLZ21uv8oxqQtqBSsJIFckV4tBbGj9jJKtMI=;
  b=JBqk9gaiqr0gBEuOQmFmwd77u9PcGKTnOxr7H8NLZVkMJbyTQv6fMZJH
   lE5/EsqCVUdfn7DMXV7qC3AbK9tPkzXjiUmwV411VVLRpAmhqKpBxl6+c
   lPdZBy06Dp7S5x1bTeU1c1UJRiHSRyOJRBKdM7413gpRCZ2HmY3GnYYBM
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RJJIH12niI1/DUbz45NHXMRahcvlpmHfpF4EicFekbEGSjKqG7xMPd8fcRJRFLB+tHYE767Utq
 R0Hpb4nQ7MX+9qs8KhBT/+xuyabzVwjmy/xZ9YDsFvSYcwHZSfPzvNW1vhpCZvzvCO6EcIPyXk
 aZa7cA18HUIpHuKmsgm6f+B/PO+y4xjXXP/pf/QYEylhCxOTe2kN26JUltGX2ezd25+zI6NXRa
 V7S/hKDmnahEmEMEOAPd55pEKgt0mYCkj1yIMGNvvJ9RBC/S0swq3Zh2WmjcDnUO6d2ndgtbDr
 IB0=
X-SBRS: 5.1
X-MesageID: 49195818
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:q+s7fq0PxUgJKOe7u+axdwqjBVlyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YHT0E6MqyLMbEYt7eI3ODbKadY/DDvysnB7o2/vhQdOD2CKZsQiDuRYjzrYnGeLzM2Z6bReq
 Dsg/av6wDQAkj+Oa+Adwg4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMSfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvEbf2UIUh6LD3wXklVKvpREnBmcca+a
 hVfYDhDc9tABGnhyuzhBgo/DTENU5DbCtvQSA5y4eoOnZt7SlEJnAjtbsid0E7hdoAoql/lp
 D525tT5cdzp+8tHOhA7bQ6MIaK4lKke2OEDIvEGyWYKEhAAQOUl6LK
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="49195818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F397DwiyIw4lI82I8wJmw93aaSl2ky6jBug4BmUmtukaAw12OUk1pake2oVkUJjlekELrxX6uPmWYT61CTM7seNiuPtGzrT7S5AnoubH00Yo5b1zbuNf0s6y1EiGAoMBxj22Ib/2ciAL/xY9GFrxwW8bQzuMwnuofc6b/qGNP3HnED7kk+Djg6WvnUPHVNhpjium6d6M10mM82N88Nb0R/Vbi0Wx/Whl3o3jN+B+UFx4IijQudhYneN4bQFY5KY24/JduP0GaCW7rRxPdsv7BRfbxpHnYCjQdX4nP0hNIrPkcJKz1V+ovTWGg4iM6n9/UBMPXgo0wl5sdgx+/1/Pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGHLu1ry1POJGU3WUjTWuDM+pYHXRzmMY7QF6rI9q9A=;
 b=KR9U8greMHT0d9PDh0T444bsAhJK6FeuItDCnrW5zW2Y2d7673Hsoh6IZv9wSTDYIM5lD1htBY2R0FuBBG4f25g6z9iHB24Sk71s/Poj2sPBLSllVgLypqS66dZTI79UzKGQEYrJvV3a+H2qtAXjYV8uhG0mlFQpS2p5BYSMdJ0wAas6uPtrITwNQ/408bhOAEex4fFtW0fEpNB1Y/XoLE72/BRsIyhqjfc9RbhZ++q01F+Eww9OvoUt2Lo9ovV+EhFqU2PlV1n84tuWWUX4jNmoze2nLtEZvXaIb4TKjyKN/DOECD1t0fcHeg1uzjyW4wEAPDBDHeBrNYSm/klAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGHLu1ry1POJGU3WUjTWuDM+pYHXRzmMY7QF6rI9q9A=;
 b=hoxRypP7Ig9uTbjGg/3V5N/QwZ/GIAnB1PZuD2bN3yX8LXZ8ce+L5JoAzA/761MFpmadxZyEskyyPlQ/YpGtXGutTgMBtSewzOZrVFYW5KNdXl4kKy0Bem/bP6uwz6NlbHcelD29MtePrDot5tgLc8s7Ed4wJdtyGHWmXehuV0g=
Subject: Re: [PATCH v20210701 11/40] tools: use sr_is_known_page_type
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-12-olaf@aepfle.de>
 <b026dd29-4c6c-3e6d-879d-b0339f2c208b@citrix.com>
 <20210705102505.41712140.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2c390d97-aa12-5cff-1e21-43c9cd29f317@citrix.com>
Date: Mon, 5 Jul 2021 10:53:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705102505.41712140.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 090e2d53-0d1a-4e59-6d9b-08d93f9abf57
X-MS-TrafficTypeDiagnostic: BYAPR03MB4806:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4806A9878E3C3949F5080D67BA1C9@BYAPR03MB4806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QX/HV6eZJf6Otbn/LWD0VTJlCvlxwnWQnQaph9XV6RDUaSycwYnkX81dHo5XQToYII6DkoyXC8WrHAD9Vv0oXnxT2j0v/eyistiEUwGXHy9KOAa664dtbGLSKMg0I3j2EOBAVvbhchw6ANTVzBLU1u8fKMPsNI3i4jcgztwTkvEjpwRL2Ix08Ejb7MbXVYjnBXm9u3KSJK7HDyGh2/IzchBWxj0Z5CyHL+rJIa3rja4ix9FFSfgI4FFktHCW1EDga1dslC+shh/TxI6616EN+Ds44pDUnqHhGfZLudFQ0cG+wphi4OyvhRzzQAKE+wVrUfktdotqVSv8CVK5nv6e6LaeYR01AcrhA9yGJBc5txFdC2jD/GHhchGws4lg07O3KRrioY6+bUGWR9aCqkQZpQ8LLvfoDL5t0mJGdFigeyTT+Cd0rIHfA2J2/g39swE4hXV28axihvfwI8klxFJ6Usq+A34yEMUJcUVgDJgKEqGhMnE7/jXjKa64Mkm92YmjG813N5qe26k/px4cZSeVU6LRb55ljRvWqs10HP9uPnHCFY6q5sDeZMOnYnXe+OR7uqb8hC0gLGsoP/N9/uib8xCN0Ts8VSmQXw4C4cgzV8hBb8sD2K+rKYN3D1JzIiXnKgaym1jKJ0N6UQIEVqhD4/m/6yYKwI6Pei0JPnd4e8vPj2CoHGjNQ8JYu/LzVyGBdHcxG5ZWt90cfOCTxPFsti8VjY10kI6gaFClMczJJjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(53546011)(36756003)(8676002)(66556008)(6486002)(66946007)(66476007)(6666004)(31686004)(5660300002)(16526019)(478600001)(6916009)(4744005)(31696002)(316002)(38100700002)(16576012)(86362001)(2906002)(26005)(8936002)(186003)(4326008)(2616005)(956004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?hsBoy/wnfnKxrkEa5+5WG3yvuif+krGqRNFAC33fdK717IlVO95F4VBf?=
 =?Windows-1252?Q?uJQQbexzYSxMJah68q9KlVdJJzzHb9Nw6XYJsWeNiTL9ua4wuIJ2tprr?=
 =?Windows-1252?Q?D5UYHU+wfebfV1++J1vJV7bqiMTDW3bnoPScEqElvkVlDjHqA1DtHsSv?=
 =?Windows-1252?Q?9R/6K8aYQKl760aew7rL3VnB2fUnpoigASmIcLUpgDcDvCXp4O0HafdX?=
 =?Windows-1252?Q?prPhtaBc86Jbrp4ovjA2nVio1CXhF/FN/tImEvBtJrD9PhzTiN65H/mx?=
 =?Windows-1252?Q?IHUewHJ6QWr9jL/noIF5eMsaaup72mowm4m3ZJFEwUjEOZhqHOmCHvcL?=
 =?Windows-1252?Q?dnmByaqaaO+bZHZPLnNw2jFu6gX8UVjgvw6mE1fgpmWclNfxcJLqMPo3?=
 =?Windows-1252?Q?+au7Ixw2hGEFXAFo1+oh5At22gxgglOSwdOtszWcS9JRBacQraFFaqe+?=
 =?Windows-1252?Q?Loi85mFR2y7Q+oh7thaU4bed6MsVy9dMy930TwtC8KOV2i1UQ+VQYbv5?=
 =?Windows-1252?Q?ONqiPa6eh+PSVjx/MgOmAt9YLY5Fqi1KJhoqF7u1AeDVmE2+MWsxLR/h?=
 =?Windows-1252?Q?Fql9XndNE5fPvFgJP/v16V/CRxlTczDK8FJPNp/1VMNC/Oz+7Tl0sHF5?=
 =?Windows-1252?Q?vNJVBHQAF4Uu1WZ+vxYxMTiytmJxlVMFQxcrcjjIvEEk1V9w6YdAPIWY?=
 =?Windows-1252?Q?6feBQmvxfdsvZGDDr3PTUCC1fJIY9t2sR6ljgk0ANd+Zzn2NTk8JEMOa?=
 =?Windows-1252?Q?HEAWPZQSoT9od7TFKASB6aJ0UGZn5iR1e6lufU5J/uaMx3WHsxPukhM8?=
 =?Windows-1252?Q?vUnnOo92VdYAp7xkFJa3reoXK8GnSSEt6xtjQN/ZBLiJ7H/nG1BJLeR7?=
 =?Windows-1252?Q?UfT8T0QgMkd2sGwtHInxr0U6Qk5q2ZZYCaSiZSN+BA42G6ebT5R2iq3+?=
 =?Windows-1252?Q?GJlFhGTv2stpEmnVbFd3MyTtlqlrozDTfExc6KcQ9o2MHPyNIakAW/yF?=
 =?Windows-1252?Q?Z9GaCdhcU5NLAowHVVnXT8jPJdMW8z9+GsQnB/saRVReZFJ2+RCWKgTx?=
 =?Windows-1252?Q?4V76GL6ZAqI7TUKyyZDrcSs3Gvs2dbHSdQWGkcTmRowkeAn8cjfialWA?=
 =?Windows-1252?Q?KDdLw0ofDbonOK+afCx8DQXvsAJvdEsALyQgLVuhG6UrhOBpdQdAzgnI?=
 =?Windows-1252?Q?24GcWFdHYOAVwpdRevhjv0DY5+270b2ftHr38pRZZ5ahLXxSsUUozn2l?=
 =?Windows-1252?Q?6cHG+BnTd+TlLcLoIOOQ4NeWdZ0A/6VsAz0kAH+i9E8fXla2iBPtok5X?=
 =?Windows-1252?Q?fGH9EjBOmtLKm0uaXuyuU/kroFpRvcTex6qos/+ZjIeINYQDeu1dO6TM?=
 =?Windows-1252?Q?jZnSTedktn4xSWHztRXdARPQacbB8XBPCyCWrmtsEWxyqOmbIsVcTcbR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 090e2d53-0d1a-4e59-6d9b-08d93f9abf57
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:53:31.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw2JbI+o+fdL5sBCkLa6rt9KR67eCjAf3hRdTDmgGyrzweJqlTpf1Y9Gba/ZNuzL3ov42WzYTih0ibl3/1cPhadj+BldMmgvuaQfXYT7zpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4806
X-OriginatorOrg: citrix.com

On 05/07/2021 09:25, Olaf Hering wrote:
> Am Fri, 2 Jul 2021 20:27:21 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Any reason this isn't folded into the previous patch, like your
>> subsequent two page type helper patches are?
> I think I wanted to separate this for simpler review, but I forgot to split the followup change as well.

All patches are largely mechanical changes.  It's easier to review
together, rather than split, because you can only judge the correctness
of the new helper in terms of the code it is replacing.

~Andrew

