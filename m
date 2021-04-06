Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16516355B98
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 20:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106231.203181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqeg-00009f-Oh; Tue, 06 Apr 2021 18:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106231.203181; Tue, 06 Apr 2021 18:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqeg-00009F-LS; Tue, 06 Apr 2021 18:42:26 +0000
Received: by outflank-mailman (input) for mailman id 106231;
 Tue, 06 Apr 2021 18:42:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hTMm=JD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lTqee-000099-ES
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 18:42:24 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5336b9f-1d35-4a1e-a84d-2f96a031b575;
 Tue, 06 Apr 2021 18:42:22 +0000 (UTC)
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
X-Inumbo-ID: e5336b9f-1d35-4a1e-a84d-2f96a031b575
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617734542;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:mime-version;
  bh=wQNEx/trhKHBKa6PyQbEshezd5H0koUD+pNEZ72g8nQ=;
  b=MwPGrPt6xOvjMCuDpXzLztBeR+vQGQn9ttQGdDtk1gcJQ7/YRl9hpExq
   E/JZpl1b0jk/jpDAtAq1m3pwGe83TXy7itA+TCDqG3ehw36O2fF/ilmPQ
   q/pzTjGEKXjATZiKP5sa4Ns3Wx28Yf52EImz0JVdnNgZh2LLv9jRtf5H5
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zMP7Xlwf7jpj+UWimiioXFE7XPAmvFSwLjH4xZuOD8Z1hL8WUboeDE/CK8Ltkj4sPdzvIJjyJu
 BebnfUCA0EKv5FvdFFEW9F+SNPFic0TGb6ImTmVFeoD0P2oRrH0OeDloDsp3yqw7/4s8mLrnxE
 T3DmIZM3Upq25o6siladPi5/bFr1aoQfapBNPkd8oZZAXTVsfMdcgQQuy7IPN/amgmWlTw977V
 aej0Iv05tFx2iEQnzybFbNq/4CfMV3QCNLFiapEGs3sVUxiHzVwd10V3EB+1BXK/R6NE5ST+yk
 zBs=
X-SBRS: 5.2
X-MesageID: 40858616
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wcILZ6DRkaq8J/blHegitMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmJEIyycFVB7QxQDIJI/Go
 aV6MYvnUvdRV08aMOnCn4ZG9XSvtGjruOaXTcqJT4CrDOPgzSh9aLgH3GjsCs2fjtTzd4ZgB
 D4uiPj4KHLiYDd9jb90Cvp441SiJ/dzLJ4dbaxo+w0DhmptQqyfoRmXNS5zUAIicWi8kwjnt
 WJgzpIBbUL11rrcmu4oQTg1mDbuV5EgR+Sqi7rvVLZrcP0Xz48AcZa7LgpFifx0EY8oMp6lJ
 tCwmPxjesnMTr7gC//69LUPisa8HacnHxKq59ws1ViS4cELJdeoYsDlXkla6soLWbR7YAqF/
 RWF8fM5PpaWkPyVQGmgkBfhPOrRXg9BRGAXwwrvdGUySFfmDRDw1If39F3pAZNyLsND71/o8
 jUOKVhk79DCucQcKJGHe8EBe+6EHbETx7gOH+bSG6XW50vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uIdfm5uwKzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQkBNHBUf
 rbAuMWP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5u3RLInHsfHabebzKLLhHS1MYBK8Pl
 IzGBzIYOlQ5EGiXXH1xDLLXWn2R0D59ZVsVIjWltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eerWmy9mDY0nVxNnNmfwJoyYSld0kPiR4BMkvyf7pGkc6YY3pu0HyOIQI6aM/KDg
 hFpRBS9bisJ5KdgQAuYujXfF6yvj82njanXp0ckqqM6YPOYZUjFKsrX6R3CEHsDBx6mQFjrU
 9Zcw8aTkrjFjfj4J/Vz6A8NaX6TZ1RkQ2rKclbpTb0rkOHv/wiQXMdQnqTS8KNuB0vQDBVn1
 V11KcajNO76HGSAFp6pN59HExHaWyRDr4DKAiefo1blormfxxKQX6QiSaXjAwyfWTW51wf71
 aRXhG8SLXuOB5wq3pY2qHl/BdPemKRc1lZR1p6vYd+fF628Upb4KuuXO6ewmGRYlwNzqUhKz
 nDeyIVOR4r7cuwzgSplDGLEmgGyp0iMvfGNqkqd6je1xqWWcu1vJBDO8UR0IduNdjovONObP
 mWfBWNKijkT8wuwA6Yqx8eSV9JgUhhtcmt/hLr7GK1hiFiRdXTJUlrXLEdLZW36XP+S/OBzZ
 V+ipYUsIKLQxHMQ+/D7ZuSSThJbi73iyqRacoDrJhPp6I8tLdpBfDgIHP1/UAC+C97Fdv+kU
 MVfb9y77/AMLJ+ZsB6QVMtwnMZ0PC0aHYxugP4AuUCbUggon/SMdSO+afJo9MUczq8jTq1HV
 mU6CtG+fjZGwOFyL4BEqo1SF4mInQU2TBH/OmYcZfXBxjvX+Zf/ECiOnv4VLNGUqCKFfExqR
 l9iuv40tO/Rm7d2ArKuyF8Lb8L22G7QdmqCAbJINV2ybWBSB2xq5rvxtWygjfxQSa6bEpdpb
 QtTz1uUu1zzh84jIM21SCuTLfQuUxNqSoG3Q1a
X-IronPort-AV: E=Sophos;i="5.82,201,1613451600"; 
   d="scan'208,217";a="40858616"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnJJfewEIlG12WvUl0T4f3Bm0yafA+1rgulMPI4q9whDQtI+frLyW3nLSFKXM4wsEOf8IvoSoGbxAlOPY5bxXzathgzSHmkkBsntO1oFHcXXMb9PXAtvoM6yasQLHYg7YR6x71Pd5fasxIPE8SSkTtG/g1iPONsveoV2A5uHkwh6owAOjsyTXZSR2f1WDim7c8iuNpTFM0Vp81mmMRNQqoQwgAFYdpPP1Q/IqEk58cmVY04MIGnwcdOD2V5gml1XwLyjd/5u+qPDYI0j0buZzb2Qhoy6BNSZgfliwBGaG0beIfrS7mVqyU7DHMOsrAqI8ugoNRWLDQ9Wll5bvpBtiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r98C+YPJljSygfHhvW6GZ3EnK2dU1KjitvcHRJvzDs=;
 b=N1GUJoNR2tL4McbCIvv6Ykc2yiCuUCQlrrqQ9m2Zq7RDM72KLDkyu3t2Mms7kCiuEn/4yceXHfn7noUIkBSpfq29MU8UBIgZN76mIxxHCkdypBvKANlrAtsDRm0ZbQjt8IkeRnaE9cJLuHXuPQdZnJkfawek5MUXy+waaYJXFeuhIVQmGa6gEC+etL6fw5PnH1GdaCdEbarpUJ4KqzN1Y5c7HM8M4IlA+rfMzTLDTzW68OMHdwylp18fRWdTESj5m8aTeiYZPizt422Ymmg92eGStVvNCsVBjC/+IiAFGamjYXBHzb73ZAjuCiCce2AfeGfFuGvDkr7NEQRs3MZpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r98C+YPJljSygfHhvW6GZ3EnK2dU1KjitvcHRJvzDs=;
 b=nEpV/zHRR78N9uTXm49cDDsjTSejIlB3bevqAkxU6txsW11Z/AZtzxn/HKmunYjLwWaMKPYi/mjHJr9eMy2ZSQdas7JoH56sIknxx3cHfIexL7PX9KVjx+V3yWvUropKmEf0SITmqngNdPSivsIE4gDUtXlqLqVQnODVInyFOvc=
To: Roman Shaposhnik <roman@zededa.com>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, <grub-devel@gnu.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
 <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
 <YGWH89ubVe104Tnl@Air-de-Roger>
 <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
 <f800ac60-7d49-fa08-ca8d-1c75408dd2de@suse.com>
 <f835e433-368c-b107-9963-9107d3432ce6@citrix.com>
 <CAMmSBy9w3VZpKdkSkpCAgDsRk0K24_Ssx-YvF9d_mpA8WetUkg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
Message-ID: <8abef703-2966-cfe1-91a0-cf33990ee332@citrix.com>
Date: Tue, 6 Apr 2021 19:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAMmSBy9w3VZpKdkSkpCAgDsRk0K24_Ssx-YvF9d_mpA8WetUkg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------3C76A0BF5FFC632325C9E331"
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::16) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91689bb7-cd9f-46d5-24e2-08d8f92bae0d
X-MS-TrafficTypeDiagnostic: BN6PR03MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB241990715B20DE40D51D922DBA769@BN6PR03MB2419.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dx8PxvAhOYpQkldE+fxTI/BQ8kr1SMqt3ra3n85e0RNCUE0v2zZl4Scvjhb72WabiLRkEKHXsui6AOLq/8iiajoDqQLfctFcEOcs6BxFAnhMB86yQok7OkhNMj2chlJ5ev18ExCmBkMIIsc6PyPgR5QCEaxWJmjjOcZ1xnYgzHdVovtzF6/UVmcKCGGo+34CRS59Ti6PUGWO6O2u+0NV67/SfqDeU0LF+/IDtI6MVc/VVpM2PM18FhdXPIDsBRz7GGGMWOIvWhTIcc1n/TJ8cwL3GjvzCRcGZ5IsGfcZWwGbey3flpbz5baH5Ni9LnCvYyiT2ZbKeTBFMgQFyuVR0SKvBwqjwBKqgAh3ONTh0xYIoVmiQu3KNE9/RMhX5ABQn2/a8LyvkNyHvC2j/LShCPwVtpxR+28tlnVefeWGFQpmvBDcwwfjxSjDm1sfJhYP68bos3LiimeXnb0llGmUvlfniXTYAxSZ5nnyi74jU+bBQvopscChJKZrQkRIlwkuGujdE7a70x9xj7iHpve/w/D+tiRcBrXwvKCfb65KWlOeHxh1gMn36ZqjbYaBPhQ3LIyPIfNpH92nvFBRMFE6oULrz07N6VMtiodJ5jfaXFgh4NLEzT0Juowr9icI6IwDntrTteZl79TXLuCIEHnPrM6xFcHdmLfF5o0JENW+/GexxE3q0od2XyrgFz1ixdaiTgD+cMCYcG6IQk6zJegZCiIvaOuPZvZegP2Q0UP+9tMfo1U/Id26/glgGIWGV+Az0baED3l42f9JM8BbQYrva7OU4htEwW6Pr71e9SJagw4cX6tdDSXDReR7r/puQe8B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(53546011)(33964004)(6916009)(54906003)(38100700001)(966005)(107886003)(5660300002)(31696002)(166002)(8936002)(16576012)(86362001)(83380400001)(316002)(6666004)(66476007)(66556008)(478600001)(8676002)(6486002)(2616005)(4326008)(2906002)(36756003)(26005)(66946007)(16526019)(186003)(956004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEVTUUlDWFh6N2RERmpYRDhVWGh3TGdMQmRIY2lneHBuVXhjak9hNW5OQTVD?=
 =?utf-8?B?eWJyZjFFY0RRNy9JRWZYZENhMi9zRFRybTNLTmYra3E1Smk2ZUJKUDdyZDBG?=
 =?utf-8?B?Um1RRWpOZkg2V1Y0YXNMYkZmbThmSVA3dXo4ZittNzEvR3B0aDhhMkRHcVhC?=
 =?utf-8?B?YlZiZ3ZvMnFSZjhpK2hzOFk1QUlKL2ZSWSs4RHM3ZEJPdzdhV3RQZVpFSW1H?=
 =?utf-8?B?VlY0dUo0d09NZ1o2REFuZDNhTGtjNUxrc2NIME9PalNKSVdIazRKZmMvbWRx?=
 =?utf-8?B?elJ1eVJsU2V2eXRUSDVLSFFXRGNMZlBEVWxWN2tXN0FQU05GVUIyc0F2WWNk?=
 =?utf-8?B?T2pPblpmQy85bFpCYUxhSTRmZ2tHa01OclRnRnNybUZvelRqVmFwSFQ2azdu?=
 =?utf-8?B?dUpZNkpNZ2VSZVdqcUtJL0RqS0ZOTUVjNkY3c1RmT1JTbE5wS0VSS3hObVRV?=
 =?utf-8?B?NTNkS2VQS3BtZEZhZkl1NWpCM3hTS0taNHhCY0dETGMzcGFscTdWNktsTzJH?=
 =?utf-8?B?cXdPd2hScFJBU3ZCMVlieWJZTForMUk1S3hTblFPN0Q4UDdRMWg4K3l5cExk?=
 =?utf-8?B?UUkyMVVWRnlTc0tSWWhkdktQYUlxeXppWFZWMnpJVWlZNmd5V1FHNmpuS1ZW?=
 =?utf-8?B?VkFKY0F2UmtES0NHM2sxa3FLUnRnSzZhTktPem9NUTM1UnZIVEFpalJkRGFp?=
 =?utf-8?B?b0xDL2ZoZmRld0hMV0dpL0ZrOC9vZHl2VFFsa2NEQlJhZW9uU2t2Zlo1YVVS?=
 =?utf-8?B?UmJmWmhpRDJnTE9VMjRqU2lWMXFGMVlJSEp1TWRNVVBIVE5YOEd0YmI4MEhx?=
 =?utf-8?B?MXMrR2Y5Y2VFYkE0ZCs0bHowdHRoY0RncHVlUzZtZldFSXpmUmxTTTRoRUtE?=
 =?utf-8?B?Qks0VHRLN3JiMHVBSTY2a0tIdkpmdk9YYi83V0ZCYVBmcUVSdjJvVWE0TnNC?=
 =?utf-8?B?eTltb2VXTVovZW9tQVNhMEI1cXkxcjJRbEM1Ukh0TTZTZXptdmlnLzJ6UHYw?=
 =?utf-8?B?eFFBcGlRcTkrSjZKNi9wRm01c2tNa1I1UkNBU0pZSU1obFRkM3hBbG9oSk9l?=
 =?utf-8?B?TlBybzFRYXMwVi9ETkNBWXZkcjh4TzZ5ZHo1NWpTb2I1VlJhaWpXYTlBMXZs?=
 =?utf-8?B?SGdIZ1NjZXkrTnQ1eXFRaktrWUkybUU4OVFqZHVNTGZ3SVdtMHE1R2JiMWht?=
 =?utf-8?B?KzhJaWU3bDE4VHowN0owRWpyNU44U1dtWkxGbnlrVzM1TnYxSUVSZmdCME82?=
 =?utf-8?B?L1pGbFd5ZmNVZVp3eXRhTzdCdE5xakNmREp6TUhiOWJZV256SDFTWDdjZUpq?=
 =?utf-8?B?cGltUGRqNndDNGNvU2d1NUhheXJBSEV0ekh2cmVpZUY5d2tYUGVDU1F3eEkw?=
 =?utf-8?B?Qlk3cUJscWpYWStxelZ1RVVqalZLWXRmTk10OVgzYnRIcGcvL3hPYktmZUlx?=
 =?utf-8?B?TW5LZUVJb3VsenFCQ1NGbTB2dGMyQ3lSTlZPb2JWRm1PTFNIcnpTSmhRUE1v?=
 =?utf-8?B?M0ZmRVR1WENyUWt0QnlzdkNudTRmNEczaitxOG1BT29IWUhvbGZMMnVuRUo1?=
 =?utf-8?B?S21Oako5YTlKOTlzRHVxRjNYVGFvSGN4YW1teTgwUXBtL0NyUHRMUzB0cUY2?=
 =?utf-8?B?VlNMVjFUcHoyVmVtWW1NZy9QUXVqUlI4TC9mVnBra1BSL0xETG44cyt0dXpz?=
 =?utf-8?B?Q0xqc0dneGpQZFhKMVNpbHcyeklRcjdMUGJCY1NUdFY3cEppUmFxRlNvdGJq?=
 =?utf-8?Q?RtbYtjmknjIpE7pi+SizKYfz/PixHft+nrzdmpA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91689bb7-cd9f-46d5-24e2-08d8f92bae0d
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 18:42:07.3801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdbi++XwnHv3F1qv7ai1LX6ZBzwVx1UQoSAJifcRfm0eIdczIQnlrnLDDMCiBCFKLzM3ASVOjU7HYf669e53ac/x1cCmIpFzK4StROMfQOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2419
X-OriginatorOrg: citrix.com

--------------3C76A0BF5FFC632325C9E331
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/04/2021 19:03, Roman Shaposhnik wrote:
> On Tue, Apr 6, 2021 at 10:51 AM Andrew Cooper
> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     On 06/04/2021 09:19, Jan Beulich wrote:
>     > On 01.04.2021 21:43, Andrew Cooper wrote:
>     >> On 01/04/2021 09:44, Roger Pau Monn=C3=A9 wrote:
>     >>> On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
>     >>>> On 01.04.2021 03:06, Roman Shaposhnik wrote:
>     >>>>> And the obvious next question: is my EVE usecase esoteric
>     enough that
>     >>>>> I should just go ahead and do a custom GRUB patch or is
>     there a more
>     >>>>> general interest in this?
>     >>>> Not sure if it ought to be a grub patch - the issue could as w=
ell
>     >>>> be dealt with in Xen, by concatenating modules to form a
>     monolithic
>     >>>> initrd.
>     >>> I would rather have it done in the loader than Xen, mostly beca=
use
>     >>> it's a Linux boot specific format, and hence I don't think Xen
>     should
>     >>> have any knowledge about it.
>     >>>
>     >>> If it turns out to be impossible to implement on the loader
>     side we
>     >>> should consider doing it in Xen, but that's not my first option=
=2E
>     >> Concatenating random things which may or may not be initrds is
>     >> absolutely not something Xen should do.=C2=A0 We don't have enou=
gh
>     context to
>     >> do it safely/sensibly.
>     > Well, I wasn't suggesting anywhere to concatenate random things.
>     > Instead I was envisioning a command line option giving us the
>     > context we need (e.g. "initrd=3D3+5").
>
>     That's a massive layering violation, and incredibly fragile to the
>     order
>     of lines in the boot stanza.
>
>
> Don't have enough karma to argue Xen architectural side of things, but.=
=2E.
> =C2=A0
>
>     Either fix it by using a single monolithic initrd, which has worked=

>     perfectly well for the past 2 decades
>
>
> ...just to point out the obvious here:=C2=A0 even Debian who can HARDLY=
 be
> blamed for tracking the bleeding edge has been recommending this
> for quite some time:
> =C2=A0
> =C2=A0=C2=A0https://wiki.debian.org/DebianInstaller/NetbootFirmware#The=
_Solution:_Add_Firmware_to_Initramfs
> <https://wiki.debian.org/DebianInstaller/NetbootFirmware#The_Solution:_=
Add_Firmware_to_Initramfs>
> Obviously there's no way to do that with Xen today out of the box.

?

Those instructions do work out of the box with Xen.

It seems that pxelinux gained support for multiple initrd fragments in
3.05, but the sum total of documentation I can find is in the
changelog.=C2=A0 iPXE might have this ability, but it's documentation is
self-contradictory on the matter.

>
> Now, you can turn around and say "well, how hard could it be to
> concatenate?". That's fair. But it is also fair to point out that
> everytime
> we do that we portray Xen as "not quite as user friendly as X" (and
> this is, of course, pure perception -- but if we want users to stick
> perception matters a lot).

It's distinctly not trivial to do correctly at the Xen level, and fairly
invasive in at least two areas of logic.=C2=A0 Specific firmware layouts =
and
multiple fragments might even be impossible to concatenate, and its
better for the bootloaders to bail if they can't make the memory layout
work, than to leave Xen holding the the pieces and unable to boot.=C2=A0
Either way, it would appear that common bootloaders already have logic
for this, which gets you a lot further than starting from scratch in Xen.=



Furthermore, I don't think it fair to claim that this is a usability bug
in Xen, when what the Linux people have done is upstream Linux-specific
hacks to bootloaders.=C2=A0 Fixing the bootloaders to not have useful
features be Linux specific benefits everyone using Multiboot, not just
the Xen ecosystem.=C2=A0 If you're looking for general betterness to all =
OSS,
then fixing the bootloaders is clearly the better approach.

~Andrew

--------------3C76A0BF5FFC632325C9E331
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 06/04/2021 19:03, Roman Shaposhnik
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMmSBy9w3VZpKdkSkpCAgDsRk0K24_Ssx-YvF9d_mpA8WetUkg@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">On Tue, Apr 6, 2021 at 10:51 AM Andrew Cooper
            &lt;<a href="mailto:andrew.cooper3@citrix.com" moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
            wrote:<br>
          </div>
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">On 06/04/2021 09:19,
              Jan Beulich wrote:<br>
              &gt; On 01.04.2021 21:43, Andrew Cooper wrote:<br>
              &gt;&gt; On 01/04/2021 09:44, Roger Pau Monné wrote:<br>
              &gt;&gt;&gt; On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan
              Beulich wrote:<br>
              &gt;&gt;&gt;&gt; On 01.04.2021 03:06, Roman Shaposhnik
              wrote:<br>
              &gt;&gt;&gt;&gt;&gt; And the obvious next question: is my
              EVE usecase esoteric enough that<br>
              &gt;&gt;&gt;&gt;&gt; I should just go ahead and do a
              custom GRUB patch or is there a more<br>
              &gt;&gt;&gt;&gt;&gt; general interest in this?<br>
              &gt;&gt;&gt;&gt; Not sure if it ought to be a grub patch -
              the issue could as well<br>
              &gt;&gt;&gt;&gt; be dealt with in Xen, by concatenating
              modules to form a monolithic<br>
              &gt;&gt;&gt;&gt; initrd.<br>
              &gt;&gt;&gt; I would rather have it done in the loader
              than Xen, mostly because<br>
              &gt;&gt;&gt; it's a Linux boot specific format, and hence
              I don't think Xen should<br>
              &gt;&gt;&gt; have any knowledge about it.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; If it turns out to be impossible to implement
              on the loader side we<br>
              &gt;&gt;&gt; should consider doing it in Xen, but that's
              not my first option.<br>
              &gt;&gt; Concatenating random things which may or may not
              be initrds is<br>
              &gt;&gt; absolutely not something Xen should do.&nbsp; We don't
              have enough context to<br>
              &gt;&gt; do it safely/sensibly.<br>
              &gt; Well, I wasn't suggesting anywhere to concatenate
              random things.<br>
              &gt; Instead I was envisioning a command line option
              giving us the<br>
              &gt; context we need (e.g. &quot;initrd=3+5&quot;).<br>
              <br>
              That's a massive layering violation, and incredibly
              fragile to the order<br>
              of lines in the boot stanza.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Don't have enough karma to argue Xen architectural side
              of things, but...</div>
            <div>&nbsp;</div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              Either fix it by using a single monolithic initrd, which
              has worked<br>
              perfectly well for the past 2 decades<br>
            </blockquote>
            <div><br>
            </div>
            <div>...just to point out the obvious here:&nbsp; even Debian who
              can HARDLY be</div>
            <div>blamed for tracking the bleeding edge has been
              recommending this</div>
            <div>for quite some time:</div>
            <div>&nbsp; &nbsp;&nbsp;<a href="https://wiki.debian.org/DebianInstaller/NetbootFirmware#The_Solution:_Add_Firmware_to_Initramfs" moz-do-not-send="true">https://wiki.debian.org/DebianInstaller/NetbootFirmware#The_Solution:_Add_Firmware_to_Initramfs</a></div>
            <div>Obviously there's no way to do that with Xen today out
              of the box.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    ?<br>
    <br>
    Those instructions do work out of the box with Xen.<br>
    <br>
    It seems that pxelinux gained support for multiple initrd fragments
    in 3.05, but the sum total of documentation I can find is in the
    changelog.&nbsp; iPXE might have this ability, but it's documentation is
    self-contradictory on the matter.<br>
    <br>
    <blockquote type="cite" cite="mid:CAMmSBy9w3VZpKdkSkpCAgDsRk0K24_Ssx-YvF9d_mpA8WetUkg@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Now, you can turn around and say &quot;well, how hard could
              it be to</div>
            <div>concatenate?&quot;. That's fair. But it is also fair to
              point out that everytime</div>
            <div>we do that we portray Xen as &quot;not quite as user
              friendly as X&quot; (and</div>
            <div>this is, of course, pure perception -- but if we want
              users to stick</div>
            <div>perception matters a lot).</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    It's distinctly not trivial to do correctly at the Xen level, and
    fairly invasive in at least two areas of logic.&nbsp; Specific firmware
    layouts and multiple fragments might even be impossible to
    concatenate, and its better for the bootloaders to bail if they
    can't make the memory layout work, than to leave Xen holding the the
    pieces and unable to boot.&nbsp; Either way, it would appear that common
    bootloaders already have logic for this, which gets you a lot
    further than starting from scratch in Xen.<br>
    <br>
    <br>
    Furthermore, I don't think it fair to claim that this is a usability
    bug in Xen, when what the Linux people have done is upstream
    Linux-specific hacks to bootloaders.&nbsp; Fixing the bootloaders to not
    have useful features be Linux specific benefits everyone using
    Multiboot, not just the Xen ecosystem.&nbsp; If you're looking for
    general betterness to all OSS, then fixing the bootloaders is
    clearly the better approach.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------3C76A0BF5FFC632325C9E331--

