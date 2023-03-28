Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED06CBDEF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 13:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515679.798812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7dp-0003GT-Id; Tue, 28 Mar 2023 11:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515679.798812; Tue, 28 Mar 2023 11:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7dp-0003D6-FX; Tue, 28 Mar 2023 11:37:29 +0000
Received: by outflank-mailman (input) for mailman id 515679;
 Tue, 28 Mar 2023 11:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ph7dn-0003D0-RP
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 11:37:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e80ff479-cd5c-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 13:37:24 +0200 (CEST)
Received: from mail-sn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 07:37:22 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 11:37:19 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 11:37:19 +0000
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
X-Inumbo-ID: e80ff479-cd5c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680003444;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=npx8/bKfU37mgdzZKAlH+/AUuNgEQ3lxICNG78LpVrc=;
  b=Sbsk0tfmI1yoUJgSSy/JfjY9I13FiDcpWCUQ8EN37ggDeDZIJOapBv9W
   4mjYiLTl3Fc9Tsl0ngn6TcclCvNTMD1ue0n9AjCMj0rZ3tLxRU12gu9eS
   xuanHTqzVGdXszMsDDjCdjhGX/ZXI9RioETmgTtMuUWgSzzvUlMnpHlt0
   k=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 105733176
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kA1AFa2HYFu8Q8W6l/bD5Q9wkn2cJEfYwER7XKvMYLTBsI5bpzMFz
 zMeDW2BPKnYNDP8eYskPYi2o0xUu5/Tz9dmS1Q/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfESZCq
 uQYKhE0bgHYjMev7+iQdNFxmZF2RCXrFNt3VnBI6xj8VaxjeraaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6PnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv027CUxnqkBur+EpWy7eBz2nmR2VYMDRAoZ2SG4sDit3eXDoc3x
 0s8v3BGQbIJ3EmiVNz0RRC7iH+CoB8HWtBUHvE66QeC0a7d6UCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaOyETIXUTeCwsQg4M4t2lq4Y25jrNRNt+FK++jvXuBCr9h
 TuNqUAWn7wOieYb2qP9+krI6w9AvbDMRw8xox7RB2Ss61sjYJb/P9D5r1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb5FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:RGUe6qiv/YMfbk0VvYaMmx21wnBQXh0ji2hC6mlwRA09TySZ//
 re+sjztCWVtN91YhodcL+7WZVoLUmskKKdgrNhRItKPjOWwFdARbsKheSN/9SJIVyEygc379
 YFT0ERMqyWMXFKyevBzU2fNf1I+rW6GaaT79v2/jNWYTsvQYdGwCdWNj2yL21RY019KadRLu
 v+2uN34zWhfHgMbte2HBA+MtTrrcHQiZTjbQUnKnccmWuzsQ8=
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="105733176"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgWgF8oPuVmsjpTeiHYthlyqOoitngwkXjs6xgGULjCzRHmPNDSHMsjYeZjPxj+UOrikKe8HKOiUV1ny8FpVgxLtb6JDMU3+ZnTbXW5cRNzz47C/992Lzce6oHbHZIA/2iui4i43y3ccrupk5A7ZoR1pYslwjptbNtGl9vj/+V61TbxH/Rdor826XK077KV6d2IVC0aEonqKwekvWb1iVJLHTcVdxpHByhIm/cDAbJ7GvV+ltQPqmNtu4QV0xtV2sUgA6wVX02tPRqjOqkSp3O2vhIOBP1SEN3dFVFnOs9fSNc115+ugzLZEsLtt7GrBQnjGE7rDncATLWV2iAJjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzEw7p6+PZaKQFwkoCVGL3EP/xw22qVnPpTX2XO8PSQ=;
 b=VCp4TQIQUVvhFCNJb6QYnsnjjT6NHeBHmEwAKOq3TVzxG1utfkmUdxpJ4lOmMUZxOtlaWKJ2NcL9epMggoOKkTiN8G4U1/MhDplayN+y+XnxE9rdLe1mEfkcMroAHmFS/nQXKz7WJbF8nQozl+fm//Ea4MyI4zEsvn4lGv2KLW5hKtGVrcIYQ2YkE2Bn6nZawroZcz1UOcffA9ZjjxmEfInHpo3oBBdBCmkxhqvOv0hLUhpdwxdLEhVP8ftbHEJgVxHhhgu7VwHXiisWjNzA4vj2zqlkxnuPs6h8uyyMOMlZG0BZTt0Yi0wfbEodyB5l9ouuhsrfz6PVeci7SlmgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzEw7p6+PZaKQFwkoCVGL3EP/xw22qVnPpTX2XO8PSQ=;
 b=aI7sYyYDaQ0Vn5QI1hy5w0ZLnzyEKLZB09/9hsJe40udzTtAiyj0CmTpF45VnYoS03oBheNPL/6SCc0X7qPfQsSQr0UENAmqKWtzA32/0ShjkKw0XuWMEutWGMy98HSUMmgQaezek6s6O6l6gC5FmsEzFfgmJ8R2WHaYpTYGR34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 13:37:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Message-ID: <ZCLRap2GJE0xwBCN@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230325024924.882883-3-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO4P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO1PR03MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 58053972-833c-401f-3aaf-08db2f80c99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8md+SzhQ12WXcyFNEbZJ8NBJJhi3kbpqwMkEFaEJVn4awZROXiQB/5XNxJ+3Q2z9dBo48abeKc2FXEwfRIlfCQeBamE4ZVceovc0G7AqAQ3S+hQBoYZuYL3hKTW1dFCj2AV5k3a/086bMffew3u+BCV6IX13beuz8cATmCNEJgu5lEMWHcLoM7sA74i/S08UIHsef8M4ialDp3nQEUCvScx9JOrl1lDDuQSrfObpzdxmu3fUaYMLoebpuUrORcEhgrxAgvUje6pFl4Lz9+QChKVAe1wgazKa/ZBFQWLrT0u7I/fYsPkvU9a+mP7SIQFSRJsN02S4TO3v+5I0WmA/Ib8c7IzdD4mRiQSZP015Mx6AmrXiovXjAGqziX1jamLRd/6rtzOBKynhDNgdfj2MB4Ue/5eDzI5fWbfqkBL8T367eWD/+oh0vh2WbuyMaG4BXTc7KDd39KU/NTG3sZt2dgrUhe21u/eV8Lr64Oy6bDWK1fq+tB2c6wuwvu/SEFxdrlGv/pDnlahnE8BCcf3HzadjBBA3jqRp5VxODG5PNl56EePqrXCFTRjlTQXdmsOF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(33716001)(86362001)(83380400001)(9686003)(6506007)(26005)(6512007)(5660300002)(85182001)(2906002)(186003)(82960400001)(6666004)(8936002)(6486002)(41300700001)(478600001)(66946007)(66476007)(66556008)(66574015)(316002)(54906003)(38100700002)(4326008)(8676002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NklFMURITjBBS2NXeDBNWjcrRHNBbTVBRHNLQStsRXF0UUlhTTFVMGpGSFlS?=
 =?utf-8?B?SVVVLzhxR25WOG9XYmN3YU5zTTV6THZybjdzeDNTbUNhZ0xlV3J1QUFSbzBQ?=
 =?utf-8?B?ZDBEcVJGTnhvOTUyMmNyajBEWUduSEYyakZVOHVPSHpaYmlKUjZQbS8zQWlG?=
 =?utf-8?B?cmRtTUJjWVl0QlhEMEowWWJ6cmN5V0duYVZwSEdBT0ViUDVzVjhVZDZJRko3?=
 =?utf-8?B?L2RSK2pzN0QxS1BCTlh3eFprU0hoOEZnbWtyNHYvaTZNejhMdVh1NkJ1ZlZR?=
 =?utf-8?B?SjFlSGZkN0dMNE9YSFhzeXBzVGkwS1VxRXJsMWQ2Z2JZOTJMejlYMTZqbDg0?=
 =?utf-8?B?cVJCWlM1Q2NEc0dNY0UwVGRtd1licWh2LzlnQk1aVGVjdWhhNjRCSzNnZ21R?=
 =?utf-8?B?ak44czBRMzBzOUhLTmpOeWx6ak1yM0liOERKVnNibkZ1dUd1RUNrNlMzaFR4?=
 =?utf-8?B?WnBrd0YzUUhjVTFCTUpNamhPbCszOVZNOVZyOHBUaE5yU2d5RE0vQm9QdWZB?=
 =?utf-8?B?M0ZKSGpLbFVCc1VBZEJYb0NYVnNQYk9GRUR6MnFnTGhBQlNKUzJVbklCeTkz?=
 =?utf-8?B?MDdnWmdvTzZuellIWmtISDdjN0kxL21DYndwT1lmK2pvaFE5OHlrSUZsSlJa?=
 =?utf-8?B?bFFQMSt0Qml4QnhObUhoSUdQZXJPbTZYWEloUUtTTnFPYUcrajNJU0g4dnpn?=
 =?utf-8?B?QU13TVlyeHYvSUxKRGZ4YVdoRHpPRE5sSFJRNkdrdVBXblJreGlCcGRGRTdJ?=
 =?utf-8?B?aUV0S3VrdUdYTUcyaTBJeDFzWk9teDB2SnQ4bzVxZ1FSTmN1TFY1dlNZSTVI?=
 =?utf-8?B?VnF0OWNVWjc1RDRHNHdNZ3FBZzlMYmk0LzJFWjdTL1FaTTRHK0FVdEZwbjhP?=
 =?utf-8?B?WG95UVFyZHJaWkFBZjExc1Vtbk80R29NS3hLVUsva0llaWZnSlNMYWhkem5n?=
 =?utf-8?B?U2haZmdXQ0pZaGhNUFNhQmVWNm9xT3VBSUVhZGI4RDF1TGxYTCtTTUtxemVq?=
 =?utf-8?B?WTJCTWh4ci94cHkvb0hTcnBNM3RWZytyTTRsM2ZBMVhuakt5Y0lqbnlPUWwx?=
 =?utf-8?B?aHN3ODhwSkR0RzA4WkR4U0ZXQ3BsWWhTcWs1ZmRlbE1xMW1XdW5aNzNyczls?=
 =?utf-8?B?VUphYXRZdnN6c0paUnh6NVMxNzh3QWc3RXYrUEJGdGV5dzJUU1FSKzFjZXlX?=
 =?utf-8?B?Z0ovdU1mZ2NRandJS2lPakFpU2djQk9zZFFRbnlvelpMaUFBTXN1OVd3bGVk?=
 =?utf-8?B?NTUzeWNzc1JubkxaeEtUSU05UUR4UzYrdnZ4UEdUVTNZRUxid2ZvVnVIY2Jk?=
 =?utf-8?B?TG51Tndnby84WTV1OTVZQUVSUHJqMWV1ZklJbDZEL1VNWlE2NTJBUzdmV3R5?=
 =?utf-8?B?OFhGb0k5UzB5blJ3UjF6U3pNZTJTSWpoazFSZi9ISE04NUxBTG8rUjl2WG9j?=
 =?utf-8?B?Vnh2V2RoWnhicUhIekdXaWxjTnhHSnp1eG1Yc2U0dlp6ekNEUkR3OTZpaEZI?=
 =?utf-8?B?WGpSQmJEc2NBOThFT1pHVlJxdktQVFNwb082OTJqOTFlVzRNSEI2TjZ2dDNT?=
 =?utf-8?B?ZmlQUEFZQlpublhlZHVuZzZLaU13Skl1SzVMSlBEVHY0b1JTSThMZFBLanhH?=
 =?utf-8?B?MElrM09jTGZRNkQ3czFmV1FIdEFSTmJmMktxMmh5MEdMVUgzZU9FZncxR3Q5?=
 =?utf-8?B?VnVxWm1GakpldVkwcVlhRE9tdDRqVkQyQTFiWjlqOHBoMU9DVy9pZ1MyN3pi?=
 =?utf-8?B?L1BSSVk0bjFlaFFCa1NwREEvazhjaGNTMVp6bHRMMVFkajJwRUVHeFBOZ0lI?=
 =?utf-8?B?TjAyNWFGVjRkM3l3QlFMUWFyRHFXY3JYQ0h0NE1HNnhzKzRpZ3NnTVNUMVh6?=
 =?utf-8?B?WENLRmhUOVpNbEYzNXk2czhFMHRncVhqeHRzUGZTSUZwRHMrVGJDb0V5M2ZI?=
 =?utf-8?B?UnplZGVHUGd1UjU0eGViZXFhMERlek1nL01CR3E3dXdDajU3M0dZRUJZeTEv?=
 =?utf-8?B?eTdNVWpUVHRCRlN4R1hRRm1XWFJEd2ZFZDB4YURhaG1ML0JDdGppQjNUa1Bz?=
 =?utf-8?B?YkZxR3Q1Zm1oTzVlVy9EQy84d1VpemJYQUVGMkJ5VkFZdHlyWmU4YjQxZGR3?=
 =?utf-8?Q?PT/lk3LqsW8zDKpcZOeVkY9IT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JkEI5NGh41Qt3JKVRR0jptKdqX4PVxsGCYsd7pRecHRgYDpLMa62JlHPIlHBDf6BtZuGCx9gCbZKUrltOM8tW8PI8N4PrhdWnZGEoCTuR5i1uOrW/QEahCTci0Ycsqjg2B12i9qtCnqsm4x1XgUQud2kAforgU29FonhYUPe6ZIyoTxqK2SeWpCEoFkFj70UOPtSlcKD71OWj5jptZWhjKULnbpUkO00pwYegPN1hxWAPDAobbUQprfc2i7eotN2tW2cMY8XBHDinGBTl5UjOdeMEXgB+dTqBEjU/pK4cAvlzZF9vEcW3r4vkMohiRcproFl5mwK0lxVJ4hOKs6Uw3DKpmNQZe1e8AfHOVyZIv/6a6HrQLySJ99X8JAl9vvwexc+gP8ztUDGiBoe81Kr353D1v5znYhZRvVj1PpGRLlP439pbNAQukA9lSyR/8tVlNyLBAIm8g+fAh7t9ylUINLXNb7TVQVAeDMa+CiFeSbmN6lv/Dah+27+4piPXidJosfaBGAaoptqLIsucdfDQJZQsCEm1UnclxyD1H30IRRbxWaqoas0UjcMJKCsSk/59aOg73gAwcwxBcr5ot3grcw7lRB8FIrA4n4r4q7ZvYBA87COr0/50kK4zlmScglAAJtGJh0qIO/4nX2oCXTBG/XO3xvKHuqjaoZQbFMxy69yWXkPiZo1RwG7F5LKYzCSHhdJ21MdN/wx5LpqKiwPN6gE8YmHYhNIKh2+hv7+vQo5FRknOXzlAvYvRGSsKNdXfqRppLnx/1sFf7C/4TAPLFVjRcGv8ZJPRP2Ypegj9TmI1jMPeJPB+hxHOoh0Rswp8T7jjnePgpzt0Nafdg/qw8evtCEvkhNTYdReMDs2YaFHlDkqgBSGLHHvNAx8Pzksy6yD5FY535nPftHkHQKhhXUid6c6M69B39LYKFC0ssE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58053972-833c-401f-3aaf-08db2f80c99f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 11:37:19.0844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFpnITTFqUB3b6ME+GBb3vsSeHY7/kBaU0UZDSLG8pGibxwks5S2+KtNNA14DbWc9Zl6AZMBwwnTL8rnPWeBXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5937

On Sat, Mar 25, 2023 at 03:49:24AM +0100, Marek Marczykowski-Górecki wrote:
> Some firmware/devices are found to not reset MSI-X properly, leaving
> MASKALL set. Xen relies on initial state being both disabled.

The 'both' in this sentence seems out of context, as you just mention
MASKALL in the previous sentence.

> Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
> setting it due to msix->host_maskall or msix->guest_maskall. Clearing
> just MASKALL might be unsafe if ENABLE is set, so clear them both.
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> v2:
>  - new patch
> ---
>  xen/drivers/passthrough/msi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
> index ce1a450f6f4a..60adad47e379 100644
> --- a/xen/drivers/passthrough/msi.c
> +++ b/xen/drivers/passthrough/msi.c
> @@ -48,6 +48,13 @@ int pdev_msi_init(struct pci_dev *pdev)
>          ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
>          msix->nr_entries = msix_table_size(ctrl);
>  
> +        /*
> +         * Clear both ENABLE and MASKALL, pci_reset_msix_state() relies on this
> +         * initial state.
> +         */
> +        ctrl &= ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL);
> +        pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl);

Should you make this conditional to them being set in the first place:

if ( ctrl & (PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL) )
{
    ...

We should avoid the extra access if possible (specially if it's to
write the same value that has been read).

I would even move this before the msix_table_size() call, so the
handling of ctrl is closer together.

Would it also be worth to print a debug message that the initial
device state seems inconsistent?

Thanks, Roger.

