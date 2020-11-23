Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868C2C0D7A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34466.65560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCrC-0008Mm-PA; Mon, 23 Nov 2020 14:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34466.65560; Mon, 23 Nov 2020 14:30:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCrC-0008MI-KD; Mon, 23 Nov 2020 14:30:18 +0000
Received: by outflank-mailman (input) for mailman id 34466;
 Mon, 23 Nov 2020 14:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khCrA-0008Lq-IA
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:30:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c82c84c-7e9e-4739-8bb8-35aa458c212d;
 Mon, 23 Nov 2020 14:30:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khCrA-0008Lq-IA
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:30:16 +0000
X-Inumbo-ID: 7c82c84c-7e9e-4739-8bb8-35aa458c212d
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7c82c84c-7e9e-4739-8bb8-35aa458c212d;
	Mon, 23 Nov 2020 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606141815;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gFXqga1oMk4Udo3cl2Q8/5xxLWu0sY5heonPRRyRyuY=;
  b=W9akWsDyDo+NQc6Ysfqq9Y37MDEj6XEvEP13Ld6pBf//W6yAlhj9Akwk
   k+Tkc5DCm8qSkvbxG6V+DQRNKUnvtu81lS1Nashef8jMzG0E7xAUdfx1S
   dRRcnwzjLmChHGZtfnLIUbpvVgGgzR101v3OJ2ApB7yZw4FbkXbvzXGZr
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: It0JTbDD6Aym5pd3q298kS9/wQZlL2w8Eyv4pTiSa79r9CfQq3FHpwUVH8BHF+MAIARWZRMfDK
 rKTbw9bUg9vd0pQ08FwuKa/bwAthGLWBizU14aLFaf7/UO/VwGBcgysLlGIrj5j1la0nQ95nbq
 OfmQta2A4vx+7L3juLYw0JuBsT88IDonLygnE9Z75Ct/x5+BLi08fxjquL6xg/46TSXapUOFyN
 p1H2v6BoKRSyXZi01Zj06/fiR7d2Thd63Ck0hE6gXv8iXHujTdBWOqxuoUADEcVU7VSjF8xHAR
 yh4=
X-SBRS: None
X-MesageID: 31758649
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31758649"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1D6ufz8RKlDn2ka7t6Xpxa9Xas245gK3IqVj9/1DLfHIOKvG1tvjKIumSXQ8tnhfKMJAYI8yQ6lAFcuuLBkaEKkUxCqeiG4ZSMLGW01sKxJt90SW0FdF5QxPKnK6QRr4Uc3yB3cxVrodAU6XsRNt+vtO6anX0u5m2xnaHgxOEx5JZ5wTRntDLFZcKN+x3uwGlkPEKkdyCYEC5dfVMx4BFqFdokiBgPXtvBXhew9cMLlao1gJT2Ro0bHMcIS7d6XptkaRhZZ2o438ee+0E/z1ruTOdHYiYzs2nAegAFZ0nW0gVjgXDPs852ItWvYbEYhMCDlDzbxQQ3WXUoTqJc9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfNA8hwIVqbVBxLUtTRL6SHTSdqw9MhH+OlkaXnc0u0=;
 b=EaogWZciDN+/EW7drvm4l4RTRXtwiDYqOi5ui3ZLjuEPO5v3EfOa/rRquqAKQ8TRYiE4VdwL4KWGTU5zJmKYGS5/KVHMzq5Gyi4T0HNZj8WQGdN47Wrq6obg1dtyyTNzAqpmDh5RtryCsW6e1Y1cG55A7o7v3giBeHqryFw33T9poO65uFPHC2v5wEpsvC5FGs0yUjuqvm+PW7X1vNuNtAr1W6GXmhCgJ3fuOAJTcOmQaRY5CSvbQW81Va9MFWz5LrQQ+9NWNCvMalvAPRf7oLZRFQcClNC98EBVKJovjGjUpoQe6lbumdCjpxImOyWlYH9IkntugpNmgsCdBWd9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfNA8hwIVqbVBxLUtTRL6SHTSdqw9MhH+OlkaXnc0u0=;
 b=hQ5dEsg2DG6JceeFYplFnjHDaWe+ZnSkgQJtdCUg/eQSLocfmQ5xKOpRJm4LsSvENYeWGxnAzYzIKadLx4Z8FaYvWJDYcQ8LyFrIGV9zi0CRdIUXdBZ2Lqg6Bb8QsG2foFvFigiqEhwCCzceOmubri/1dueiDSU7gt3Y9J1JrHQ=
Date: Mon, 23 Nov 2020 15:30:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 1/4] x86/ACPI: fix mapping of FACS
Message-ID: <20201123143007.avmqwbwxfyk6owpr@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <81a8c2f0-ae9b-98e0-f5c5-d32b423db491@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81a8c2f0-ae9b-98e0-f5c5-d32b423db491@suse.com>
X-ClientProxiedBy: LO2P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17a4936c-1020-4e99-e7a8-08d88fbc4974
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB560833DD9209CCC2D94A8E2F8FFC0@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTx6Ym7UE8EUCkTCyqcZJa7H2N/GH4apx8WTmdSvLNweZncAuHQfL8ln2206apPz2kFdyt/m+mujRZr6+cp6JI7PGB4ZdUntbu1amDKkJRI31LNF3OXr5N9dthsKVR4KQI1tKzr0d3+vfYDduSRQHM06eCTZHVI8dnmmjFYqpJV/fJI3Ny8PU/rMSLquvlCdtiRmR9SazuxwEY5XSZNzl8Wiztx8Qt+A+yCQhky45eJOZmZsltH5m/SuGcC7BQ0kIIO28ttCz4GOpYZQ7RZjIktegrfmC/OZJmxRKYUkt+lxAgOcxYhA0Z1XQoTqi35bnSu/qmxU2vVwL9KqWjjIdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(346002)(396003)(136003)(376002)(54906003)(478600001)(6666004)(6916009)(33716001)(316002)(4744005)(186003)(16526019)(8936002)(956004)(86362001)(26005)(85182001)(1076003)(2906002)(9686003)(4326008)(66476007)(8676002)(6496006)(66946007)(5660300002)(6486002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: z0OtOHsB6/eTct0NslN1Hq38TXxVFkVBq/brf9jjEalO2eBVjASjMs+WBh03q2DulfrpgkSWokMCBGAJywbbfhIAYblcpWIp/oKJQs+sH7T0RtJpCa5+cpqLXwfZRq7jm82l+XH+p3VFuDLpV4q9PYbore1uagJqr2gmbsyn9xjj+kxJNIdorBWKVH1lhzQnuGRWDD4xHpiQVePQTrZ6bLn7MBp1RWWDjandWaofNZcme2+9EqhJ7ybqLPExQ7F06qajXNiFYqX3iUxwoehRvmzj8jZ5xd4haUSAI39885WxRzHZhRtnECUulB1kwNWPgaRO1CfS3tEeWVbL1R0IOKp47dMeVEa0Twwpdn0K+Ez/dRgGa1EFx4s7S9tclJnofkB5NVHCwN7FnmG7oQ/CeV5pdM21KFAqGrbrl5TqzEhU5vPcMEt+XvhZkDdjZZHsazZ70u5GDjO46EY1YI/g2V53stsgX0stw1AXYwkWwFMN44lfHpovJvD1d8Oej/iGKHKL7jDshSuarPa3yTnpo6/8Ob8ipGxsXcC3HNOJJqYrLIL3w/LSdEHL8SHl896B4KqcoWh1kvAd7+MhP3AxmxiD5V3g7DzapzIigflKKBx5uUUZVIbLia8ZidEOHhZQJ0q4Xde6YmszskPEX0f9kQobU8IeuaSwvhuYzrG22FMWQ+fe9E9gX3eGva0Pf/2EgyV3m4b7pSKtv7fB8Sx46CHbxqIDEwQqttJdJpSVNFFVzEDYHWvIC2tPFjOBnGcCkX9AIELyUPRxoLTH6D2vhdURlOVdeaJtftb5n53fNuhhcbaqFzC/+9d4SSQvykXedYTdO7k5PmM6DxhhyozyQKj5/9cUazMQ8YgWKbZdUbQkVpVIojhTJDrjPbwtcBxusJA+zJSkjNDVmNRvyXbZxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a4936c-1020-4e99-e7a8-08d88fbc4974
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:30:12.3649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZFtiJOKqi4Dp12r2jWMeeeUEqZ3IKHx7aT3L6fwRtI+XzRWtC0r3NQj2a1P50OQwlZkFNfhmt215WaqQFjYPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 01:39:55PM +0100, Jan Beulich wrote:
> acpi_fadt_parse_sleep_info() runs when the system is already in
> SYS_STATE_boot. Hence its direct call to __acpi_map_table() won't work
> anymore. This call should probably have been replaced long ago already,
> as the layering violation hasn't been necessary for quite some time.
> 
> Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

