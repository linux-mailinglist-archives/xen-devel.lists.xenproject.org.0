Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE654E51B4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 12:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293866.499377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzcm-0002vW-1G; Wed, 23 Mar 2022 11:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293866.499377; Wed, 23 Mar 2022 11:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzcl-0002sh-UY; Wed, 23 Mar 2022 11:57:59 +0000
Received: by outflank-mailman (input) for mailman id 293866;
 Wed, 23 Mar 2022 11:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OhW=UC=citrix.com=prvs=074292745=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWzck-0002sb-By
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 11:57:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78c2ebd7-aaa0-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 12:57:56 +0100 (CET)
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
X-Inumbo-ID: 78c2ebd7-aaa0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648036676;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XtJc9h+0ftdD0vMuq9LZdhA76PLLT95v1GXDLXz+d7Y=;
  b=PlV5FuFoSUADWzXG7+oB08/NKf/a0cVDMt6W/AkM2kFQOw/8D4cqAcXp
   i5WEPZush1kxfUYtXj8haTaspp3o44lj/Hd+xZi9P6dopsMbvN8TATJZg
   0zUNhnD2lf4zFihqtXQ2HSMxQK39gMvFhI9WNrHeDnsnKbvwZNf41oKQd
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66867415
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lx15lKCH5elvmhVW/9Tjw5YqxClBgxIJ4kV8jS/XYbTApDMn0jJWz
 jAcDTiEPvmOMTOjfIwkbIW29k4Ov8PSydA1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhOz
 /xTsp+6dj4FGYmRgvsdQzobNBtXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgmdu2ZwXQJ4yY
 eISez9hYSnPWSRAHU4tOJcykf6Er2TWJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKosE7m/+u9vkUek7GUZAx0LVnO2ufC8zEW5Xrp3J
 0UK9wI0oKM19UjtScPyNzWnpFaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAajUDVhAt+MT4rcc4iRenczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/5q81E7AgDiTn7TualMv+QXHfSGC1CosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y4Dpg4jfIUO/CdkTNrGgk3NCZ8OEi3zCARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUj4gOXFNS7IFexaWLdrUgzfxPnZyOky2
 4wCX/ZmNj0FCLGuCsUp2dB7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt6E7GJa599z7+Sl
 lnkAxcw4AOm2RXvdFXbAlg+OeiHdcsu8hoG0dkEYA/AN44LOt30ss/ytvIfINEayQCU5aUtH
 qdfJJnYXKgnp/au0211UKQRZbdKLXyDrQmPIzCkcH44eZthTBbO4djqYk3k8yxmM8Z9nZFWT
 2GIvu8Dfac+eg==
IronPort-HdrOrdr: A9a23:/XFyiaDf8QI723vlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,204,1643691600"; 
   d="scan'208";a="66867415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3nzclvhT2/MzXatSsjXn9eeUhTz8/W+tROdaZvyn+YPupWsTmcunvfZJVMZ3n1HfPL4wgEdDlMc5uWVmmJS0HZEB22atYgqHFK/GkGYbzLL/3zz+a5rMEVeu+dbBj5OlzCoHQh3qj+Ft1U9aOFUNYOeZ9C0/Ao79Lj98Hao56j8xJp6S2/kPoX7u55ra/HygsR1pn0nbX6K3Ki4b74PHhGzCdHnGnxa4MGV9i6VQ7Qoc8CUHFKHQ/vMXcM0sxXwsjrGuhMjy/B2h7hr8i8yUaZlpYJJgrKfJMDH/l/ctPWafSqXRKcMVdby2cB1+B7/ERXLx9PWAZN8XBtYWrMFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPeZtRLTus5YBLGtYqFQUxPWCUlY+spDebLkuRAY0h0=;
 b=AtTr4TFpw7xZIgjvkoglIyZ623rSbcjb6+g0bgAvdDjly8Ikgy4eRdcV0mEviHXeI9byCgtDuEemvXfeyptgwERkImH05tZDqvT1ir10SuRUGscSq6FBTONuOMAsrJ2/5DNj4lslnVW9PMW05wg/F5zxYQAi3VdNZ4PGJCeTQh2hMc/8oLnmNKJmAZ3/X4q83BJDxyhB2zM689f9aU4wjrmuI1o6qc1nCVbZkLcZXi0qIZrX6YJEDmhqP9GYntDvtO5irt3pcT7XtsEqlJCqsO3Cv08vel7zsAzXdCAeLBAyFMrAWYFvAOwse8Dj6UB1hQVdw9VkzoSeXMsJb9Obrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPeZtRLTus5YBLGtYqFQUxPWCUlY+spDebLkuRAY0h0=;
 b=nYmxjPREt3/2WLimBYp9YLgG8EATJnzHtfZBrqrurTTlPUBFbvxXSw9HxvLHwRxDK+P4NpO/NX2yatDVQhoKPoW4Pfpu6uFWca6L2ggtmvbiDG6hBwhmYZnWKN3EgcVFk1JYcvckpDnHf3NobyYwnaafrc3Ql01X4JB9rLtRJDI=
Date: Wed, 23 Mar 2022 12:57:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YjsLN5Kre4BdRlI1@Air-de-Roger>
References: <20220316091315.19281-1-jane.malalane@citrix.com>
 <20220316091315.19281-3-jane.malalane@citrix.com>
 <YjL4J9wDGCtc/rRv@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YjL4J9wDGCtc/rRv@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0491.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bffbaf5-613d-4c46-c870-08da0cc45a73
X-MS-TrafficTypeDiagnostic: BN6PR03MB2961:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2961F7ACA628E036EA6225EA8F189@BN6PR03MB2961.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5xSg8Bo8tlWbmJAJT2KUnw/DSeMX+MgVXEL7qrbJ1zqcbtZYBCaXGNgWFP+pyUyZboPFTeOVIAWnKZ2mQbJEVnDFG6F1eG+e0eietEUmrG6lnW/Vu9QxAnHqom389pOlMIc2tyIVFT35/XiNEEiYbF4f1xDKLct3QB84jwNVxGY1MZLXkya854vacj/hP9pqWIWARgfBxaQHas+VLlHYHf9D1isXco6/ynvhZb0wC0EpnPeDXo8nrqGoQVu9kRvuH3y/2xNqs67FPUn+O4FODYohvPfJlDRs7GNNgV+7P82g2pWusCIOcGvoPYIulSuscgd5Qjv+jIIqIHkGvU8AHUa/mKwKsz8e7HpEtX2EMfMsTqSIWKTF1gaiWjXyN8mPA3hgziuIFYG2G0fH7dWU2oP4sLeCfOjmaJ/nLZNAjMId3mA0aakMVX43/PgvJO2fdi8hsSUBe1zWgrxJM1hC5cZQp9mVLqzh+5ns9OdMK8QxLC+XkSsydh9OzHw2W4Jjg/G78HdB+gM3YDjHUFe0T3QqlqZg32LBikrYp4ha40OXw49aC6yltmFvd2QHQEeO4IGTYJ7vqBZR82f+8wxyQo8kCnd5/78AgZ+NnY8KCsI6a409RQsMVAk4AyjlWgeu83amxjwrW7SzeppvM7uiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(6486002)(186003)(26005)(316002)(5660300002)(33716001)(54906003)(6636002)(2906002)(83380400001)(66946007)(6506007)(66556008)(508600001)(4326008)(38100700002)(8676002)(6862004)(85182001)(66476007)(6512007)(9686003)(82960400001)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDk1T0x6NDkzNDRLRTV5UXFGbUhxcmJpS2R1Z05pazdkMnkrd3pWQ2hVSzVQ?=
 =?utf-8?B?cFVwMUkzakJYcWxFOVcxemNjVWora2gzU0UzNHpQTU9YQTNsSXNhWTd1cnpt?=
 =?utf-8?B?ZUlxU2x5U0doMVhzYnd2STdnbEVTRUdXM1VyN0lPWjdGdWQwYlhyS2JHeGhF?=
 =?utf-8?B?dXNIVXQxeDA2Wm9EY3ZTeENGdGFGMG1Jck9FaVhDTVVEcXRDTklLOWJnT0l1?=
 =?utf-8?B?THBESXJuejRBbTBoNWpocE9uMDZMa0xnTnovaFY3bEpTZ1g2b0Zmems5b0hp?=
 =?utf-8?B?UURjNFN0UXNIcjBPTzRWSEd3T3J0bnBTbmdWTmpHa0hsTkRjS3laV0tuY2RZ?=
 =?utf-8?B?cldobzdBUVI3VWUxSlMzeVE3ZG9ZM1czZnNUZmJuTFF2WStkV2RtUTAybFVG?=
 =?utf-8?B?eWpiYjg4TkE4RDhSNWJZNEd3SkZlMHd1YXlxeDQyZEdHeU1CM2RWNzA0cUR2?=
 =?utf-8?B?dVNKcXNEbnYrV0NDL0xxYXJjZVFOTHVHYU9RbnhtaEpwZmZFNHNsQTh2UmRs?=
 =?utf-8?B?dEZjVm1NOUwwMzZsOCs5Vi9CdzRzVTNobHV0Zjd2d1lQRlpnTG90dGlCSnBH?=
 =?utf-8?B?OHNUNEtTdFlUa0dvWHJRTHJrVkpDcnFjbG5Udy85UWVOVzk5N2tvbHdWUHNX?=
 =?utf-8?B?S2FHNEVRWEd3UkY4bUc2V2tjc3RuelZWYnVTZ1A2UmNWNk9NZEFTWnVvUUYv?=
 =?utf-8?B?RE5GS29oZDRLRTdBN2JhZGpTKzlrOGRjWkRCK2J4QVQ0MGlDVWpsdkRaSkE5?=
 =?utf-8?B?dVpMWGxUM2o3MkZIaFYvcHlQbkhKMTZ4WVZJaVNPQTFYc3ZEdlM5T1hoekQ4?=
 =?utf-8?B?NUkxWjNtYnFFZEVGUEQ1VjZmSHczb0xmQ0o3cVdBMkJOOHM0cVFYTER2SHRV?=
 =?utf-8?B?MU9DSTFieEZBK1o2TDVrZWJ2QngxZGkwQ1J4OTU4WkQ4QmNnUUw0TllvSm05?=
 =?utf-8?B?dGpQb244SGhJWXJnM0tubzNlK3Rwait2emQ4SkhiUTl0QmJLTmwxTVoyMTZZ?=
 =?utf-8?B?anB6R1lERWZlNXdheUJGQ1JDMlJ3eDFKaUVDRFczYTh0NEkvZC9IemJXRGps?=
 =?utf-8?B?NzArMDFwMUw4MVc2WDVPK3dCelVGVGdyVGR6bzlkV3dKQW40VjNBV3d0citl?=
 =?utf-8?B?SFRTTHZVT1YzbDMwbkdHdm1yQ01WS1F4aWlwK21CQTNKMWh6cDVXUFVxNTgr?=
 =?utf-8?B?ZXhhTUMyb0t5RTFZNlVCTENCeDJ4UW9qYXNSK3FvN0x4enJ4K2FWdytmSDRY?=
 =?utf-8?B?T1JSK2NnVXdtNXRiRFFWTmNOMTNiZnZ3T2JPVGJHNWFkUVd5OFQxWHJPT2ov?=
 =?utf-8?B?SEovZDF4aHBzNVFQVzhMN1NPSEtqMWNHWVhxOHhUSmpRT2RpVmE5T0l1Tlly?=
 =?utf-8?B?bmg0aGs4eE45cE1QV2dYQjlGRSsxejI2ZVloMkVpdVhaaS94MDI5WTAvNGhU?=
 =?utf-8?B?ZTNIRC9zV3BGY0k4NmFEMTNRR0pyTnNqWnNyVW1LNWVwVDlBRENrbGlOdklr?=
 =?utf-8?B?ZldncE1CVmJWVW83eW50Y1NrZmdqZEsvcWtzb2E4MEV0RDh6RVhTTWJGRlBE?=
 =?utf-8?B?WkthVDB5QnVia0ZWWnJlOTlZb216WjFCY1NiN0Rja25EQ2ZNTUZTN291eFRN?=
 =?utf-8?B?dVo0SU05M0pXaWhQNHpHZGhWRE14cHF3eUlCS0ZBdzFJZkxPVnlTL1d4R0d3?=
 =?utf-8?B?MjYwU1p4YjlhWU9jdDVPKzUraGxXSnRkRk1FRzdXM0F1NWZVV0ZkcDZTNDM1?=
 =?utf-8?B?SklaLzBTT0ttdTlPN1A0YlQrTlZ0dHVrUHFZTGdWNWdFNmJPK0xJTzltc3V3?=
 =?utf-8?B?bTdhZndWWDlBdks2TFBvNFpmbjhUM09vbyt6Y0ZLbExPRHM5aUI0a1dhQkdE?=
 =?utf-8?B?ajFRRE1JTWRDcnZrSWtMMzM2c1R5eit4SGR6WFFkWWtMcU1vc0NZbjdCVU5T?=
 =?utf-8?B?b1Nhako3RzFDSkphY1plTDlWQTgyR0pibE9lc2paMXJ4V1lUL25vSlpCZEtv?=
 =?utf-8?B?ck1sRlVNYXVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bffbaf5-613d-4c46-c870-08da0cc45a73
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 11:57:50.1068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgy4l4qvriFl7WG3KtdDDLEl/C9Qwkeh7bJhCIiKwAwHIGEyjqQ7pJvlkYTDNpUM09a20C5kMNLExnaltQ7a8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2961
X-OriginatorOrg: citrix.com

On Thu, Mar 17, 2022 at 09:58:15AM +0100, Roger Pau Monné wrote:
> On Wed, Mar 16, 2022 at 09:13:15AM +0000, Jane Malalane wrote:
> > Introduce a new per-domain creation x86 specific flag to
> > select whether hardware assisted virtualization should be used for
> > x{2}APIC.
> > 
> > A per-domain option is added to xl in order to select the usage of
> > x{2}APIC hardware assisted virtualization, as well as a global
> > configuration option.
> > 
> > Having all APIC interaction exit to Xen for emulation is slow and can
> > induce much overhead. Hardware can speed up x{2}APIC by decoding the
> > APIC access and providing a VM exit with a more specific exit reason
> > than a regular EPT fault or by altogether avoiding a VM exit.
> > 
> > On the other hand, being able to disable x{2}APIC hardware assisted
> > virtualization can be useful for testing and debugging purposes.
> > 
> > Note: vmx_install_vlapic_mapping doesn't require modifications
> > regardless of whether the guest has "Virtualize APIC accesses" enabled
> > or not, i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long
> > as virtualize_apic_accesses is supported by the CPU.
> 
> Have you tested migration of guests with this patch applied?
> 
> We need to be careful so that a guest that doesn't have
> assisted_x{2}apic set in the config file can be migrated between hosts
> that have different support for hardware assisted x{2}APIC
> virtualization.
> 
> Ie: we need to make sure the selection of arch_x86.assisted_x{2}apic
> is only present in the migration stream when explicitly set in the
> configuration file.

I've tested this myself, and the behavior seems to be correct. The
selection is only present on the stream when explicitly set by the
user.

> > diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> > index c5c4bedbdd..528deb3feb 100644
> > --- a/tools/xl/xl.h
> > +++ b/tools/xl/xl.h
> > @@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
> >  extern libxl_bitmap global_hvm_affinity_mask;
> >  extern libxl_bitmap global_pv_affinity_mask;
> >  extern libxl_domid domid_policy;
> > +extern int assisted_xapic;
> > +extern int assisted_x2apic;
> >  
> >  enum output_format {
> >      OUTPUT_FORMAT_JSON,
> > diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > index 117fcdcb2b..f118dc7e97 100644
> > --- a/tools/xl/xl_parse.c
> > +++ b/tools/xl/xl_parse.c
> > @@ -2761,6 +2761,24 @@ skip_usbdev:
> >  
> >      xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
> >  
> > +    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
> > +        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
> > +        if ((e == ESRCH && assisted_xapic != -1)) /* use global default if present */
> > +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
> > +        else if (!e)
> > +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
> > +        else
> > +            exit(1);
> > +
> > +        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
> > +        if ((e == ESRCH && assisted_x2apic != -1)) /* use global default if present */
> > +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
> > +        else if (!e)
> > +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
> > +        else
> > +        exit(1);
> 
> Indentation seems wrong in the line above.

The chunk above is also logically wrong, because it will exit(1) if
no assisted_x{2}apic option is provided on either the guest or the
global config files.

I think:

        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
        if (!e)
            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
        else if (e != ESRCH)
            exit(1);
        else if (assisted_xapic != -1) /* use global default if present */
            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);

        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
        if (!e)
            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
        else if (e != ESRCH)
            exit(1);
        else if (assisted_x2apic != -1) /* use global default if present */
            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic,
                              assisted_x2apic);

Is better.

Thanks, Roger.

