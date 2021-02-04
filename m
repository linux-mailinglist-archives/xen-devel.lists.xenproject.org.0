Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BF30F987
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 18:24:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81385.150370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7iM3-0003YY-TY; Thu, 04 Feb 2021 17:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81385.150370; Thu, 04 Feb 2021 17:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7iM3-0003Y9-Pw; Thu, 04 Feb 2021 17:23:43 +0000
Received: by outflank-mailman (input) for mailman id 81385;
 Thu, 04 Feb 2021 17:23:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7iM1-0003Y4-Vq
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 17:23:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 393191c6-8dae-46ca-8394-98991b1fe66d;
 Thu, 04 Feb 2021 17:23:39 +0000 (UTC)
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
X-Inumbo-ID: 393191c6-8dae-46ca-8394-98991b1fe66d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612459419;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XfZrpF4GOpEMLUruKR263/iHDqaN1rob3im39dLDKmk=;
  b=FCLJgVu+1tiv3/JfhgvOqmEpaKoP4MeBfZUgLmkB2l6kBRN1tdoarY1K
   nli/9wyasTZowHOi8g5wuhn7fwBz1+iMwxNdRsr2bUK1WrJrsEBUE1L3f
   /TnbGTZb6Dj38fWeAUYEU/7QxzAVKxmMSMtzi35hicUy9T3XAYCvYtizA
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7hmTvfHjU9qRwlFqlhuuhZKw9Xgofh0gILSO/PeYL1NnVe+2pn6FosI+9abhOrmNCbWIBLHdk4
 ShovRc+lIQFiDwbTGC38YmuzfSENlB2U+qGIWaSp9IpGKsQ/Z5n3JWp1Mk7YgTh3K4Nel1Sje6
 qWwf/enzQ83zdKvIsewLzVrcEZ8wKkzXRygoTFreVhe5hbDO1sDo7eg3Lu3ZOhl/aLvTJsPpag
 LQq/YSR91H0A75RINlpZWwhy9znVFRp2e4Y/IHePzRtvoMKtxRl/Bb7JnDIoBPpyRWSk5W/FRg
 4bg=
X-SBRS: 5.2
X-MesageID: 36526353
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,401,1610427600"; 
   d="scan'208";a="36526353"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKDLClN5LrVKlf3Wv9cCOMTWrVB/JjS7iRlSDXa21UEThqSz57m7ofCLb7o4lopoXW+Phhsmg5GcSu5Od/IuRBMP/DhaE3xQjNYWGrQT+AHE263hbRMaTdkhhWd0vtzQYr77CB8zlNIxismso4WS58MFtqTcncfKFqxq/2MU8EgnKgEhYZtjiBa1FBIPJuq2Z+jyW8sI4Bk3CkTLlEGFyQRXqsnwvssEO5wNBHUEWI9UxEqNKjZAyeQyS40S8g601rwWGfvjR9uP+YrC1zH9liLxrvp2GSMNACCKQsLzqNaT8oCccsUHQsz2YQauvHa3+B5E4t7k7QCCyTkJf8mFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfZrpF4GOpEMLUruKR263/iHDqaN1rob3im39dLDKmk=;
 b=ayzfpc6AAUJEEynlhbKMZbpdXwNyqIHyd3pRJJ8c58zwvYHVis3eKsrJgIxW2VS5o/1CGO2Qi47uHqpe9xHmfUFAqtWi3FlPo1SaJUqVGYo23za4vUdBc4PCe/+KjkLqtl/7R9tWrzO2wq5CvLmnxA7J2d/l3R/q15EnqCZc5AxMozs0M6pyBsLms0YmS3fPSmQef7S4C9D7l2Rdm8/ThtjPEBDiZCyTDH8LJDvEZ/YmcadFeimLhaiTuQshoRd2yD6I09p7CwuZGb1ctac3cnSgAX+6B6fq/pmaMvFpy2u7/Zn2wj5yMkVs78ksfGHhEc3lfZq5sGQk+EvFkasbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfZrpF4GOpEMLUruKR263/iHDqaN1rob3im39dLDKmk=;
 b=YaV9mNQvzJwTEPnZ6PU/UZQRghGhdRsLvh770OSq1Hj204eSji73e2p6JUX5mZMK10WE/+TU98jvr0rQDNxr46J/4kxisFG4hluMkLYijsBRAOrzuGebTsdDDn6U0FqjiYwbKx+BUYwdSV7Gin4K84SDM1TBpQ5Q//p+wwbHcI8=
Subject: Re: [PATCH for-4.15] libs/devicemodel: Fix ABI breakage from
 xendevicemodel_set_irq_level()
To: Oleksandr <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien.grall@arm.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
References: <20210204155850.23649-1-andrew.cooper3@citrix.com>
 <eee99c85-4581-87d0-a48d-06619624c8b5@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe174e27-9f86-f476-6192-f2e62c9a7e3f@citrix.com>
Date: Thu, 4 Feb 2021 17:23:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <eee99c85-4581-87d0-a48d-06619624c8b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0437.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::17) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc487f2c-99fd-4c6c-ff77-08d8c931998d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3608:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3608E1B01D50EDBCD4661908BAB39@BYAPR03MB3608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTeZtQo3Nv3YPo6c6W1aDKTr6hVkAce4WE45jPaDvGlzXJ/nX+WXEMK2OqtLXfCe1VrLNb2LZa0HhIosc2xJFdoQ7G1WB0mxojxv2HmeeHYueHsNzOi2eKC512bz8ahJ0fjqwQlU7tpE/7UfSkHnRCmhoQh6xiPFbp8/DvMb+BzwXcqzqD6Lebm/aoLls9ls9gtpP4KcWmUxat9UcgmxLfOLtSL1HFE7UJZlUTetrhbSi7VfcntJhU7ht0peK/8b4ZqscDiP8tqsJh3Kgzan7iSoUk03Xw1dAi7yyFGLjr1jXnF04NaxMQmLsPG6Oll9PoIt+KvIz23wAXR7g9Aq1Hu50oFFk/pY8rEnycSVNbcB48IooYba/r0omuHG2EelCX9tErlSCWWJtDLe6N9+MRTJEl6MMB/Dvog56ExOVR7SHCPbNq9osifpXB4FGFGjbysFJuYgRI520T2MxxJ3P8mOIjOkWAZheWE2yQ9lLycFw6v+2O13F6r2V4NeFdfBwet3YZiKoMZgFHq3WHrYR17wi5pMKTUnC3mxzyxlxjh781fwlAi3xIfSt4MH04rxFOAY3nosy9fk9s2rG9JfICkaiBd+m/gTbzNaaDaxWII=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(186003)(478600001)(36756003)(16526019)(8936002)(6916009)(316002)(2906002)(8676002)(66946007)(5660300002)(53546011)(16576012)(26005)(4326008)(66556008)(86362001)(31696002)(6486002)(54906003)(956004)(66476007)(6666004)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0FOWEs0NWx1ZlFLQXM0ODZZd25QRW9FNnlwcTFkcjRoWGpkNisyNnFldHNv?=
 =?utf-8?B?WUpLcW5NNm5ISUkvZWZCR01sM2d6RHJMQXc4Rk9vWU9kL2ozY2pEQWN3Tmhi?=
 =?utf-8?B?VitBdmF1a0xlSXZTM3REL1pBUEFlU29wNnFDc1REdnYxckZPTVNEU2ZxOEFZ?=
 =?utf-8?B?cm10bDRobmVGSFVseGFPMWVsaXRHd0Jsai9oM0UvT1N5Y0tReUNkeFc0a3ZI?=
 =?utf-8?B?aEVVZ2RSb3dkemVDYlNpSC9Tc3pNeERzNkFUUVRpUVRpTlZqLzU3bmd3Z2dK?=
 =?utf-8?B?TzRRNmxVQkcvMmU5NnltUnhKOGNwKzFuQWlMUStIQzZBNkxEZUllM2YyODQr?=
 =?utf-8?B?R2ZFSXl3TUlUSnVFMDM1Yk1wdDVJalN6Slc1RzMrWmF5YXNFY3YreEZ4enpX?=
 =?utf-8?B?dVVNbnpOY24rcUdNaGFOZjdIQkxXY3l4ajJpZGRKUzlyMFVPT2dDQUdzOGFY?=
 =?utf-8?B?NTRKZFhqTlJDZDdsYzBzcFNmWDc0MmdZak02SURVV1B5NUNXTGdFVlpIczBh?=
 =?utf-8?B?WkdVVktlUVBxOGdsMlhMK2NDUmRtQklEK0w5UFhqMllzL3FUOXJlbldmUm41?=
 =?utf-8?B?Mlo1cmxBa1cvRGl2VnIwQWhDc2xkSDl3UnF6aE5qZ29ZTVorOVFtc2pWSkFS?=
 =?utf-8?B?OW9VTlQxYnQrNzNVZHY3ZlRBamVOemhiVzk1WFhOUzk5UERrYjRtNnMwbnky?=
 =?utf-8?B?WDNUZFVnRks2L29NQlVaS29TcFBuMjV1c0F0K2ZpR3dMTEdYUkdrMHV4Ui9s?=
 =?utf-8?B?ODRxUHFEY1BXejFFc0hFZ01FcnV5V05Jb1NDUm1hM1F5ejhzR2ZUQTVDbkoy?=
 =?utf-8?B?aGVQUElRYmV2b202Um5OU05mTjZRSjZwalE0cmNzaHlmcDlHcm45YWo5K2N5?=
 =?utf-8?B?bnpReWR3aTNYRmQ5OWpib2NMS1ZzOG9ZN0pIZ2NJNG9pUUsrVndpWUZWQUhN?=
 =?utf-8?B?bXpRL01iMm5MRjhKckFKcFB2WmM5dGpxVVZxTXJackJmTmw4K0VWK2p3NGJj?=
 =?utf-8?B?WjUza0J5YWluRHZqUjExbXgxdHhudDlsNzJsYTZvRXBrOWZJbmVHTm8zVnFF?=
 =?utf-8?B?SGZTeTJmSlBPZG1iTXpHajlHR3F5eURMVzdXMlBrV1A3VFRTdFUxVi9QWG4x?=
 =?utf-8?B?VDB6L3BoZmN1ZC8rU05BZTRyVGlQWDZnRXg2OENDYTlIRnc0QS9MWTZscjJD?=
 =?utf-8?B?aTROWStmYzRZTTlXM2hja3pYZWVzVmU1NXF1cWQzZ1cxL09FdDBmUnM3TW1P?=
 =?utf-8?B?U1RYMU8wMWdyY0hhbVdhM0RYeGxKR2c2ZFhlZys1djNtYkIxY1JDMUxLQUVu?=
 =?utf-8?B?NWVCQUdHRk1GVGxnZTRMVm9RYktpNDlZRHQ2VHB4alhhOGo0amNwMVVxSjZK?=
 =?utf-8?B?NXhpa2NvOCtSaHQrY0Z0QUp2bUpTcVVpUW1VUjBIcFpvd2xCY1dDZjhQU0ti?=
 =?utf-8?Q?4s3yqTvI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc487f2c-99fd-4c6c-ff77-08d8c931998d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 17:23:34.1814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7ZMRqJKtLy/7Agiap6us2jc3xcqF3zM5mppM++U9q1YU0gMnGTWRnl+euR60cJQy8uNroTXtFt+lWao90Q88PoDLUUAGVhXJTUa0MU0vf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3608
X-OriginatorOrg: citrix.com

On 04/02/2021 16:50, Oleksandr wrote:
>
> On 04.02.21 17:58, Andrew Cooper wrote:
>
> Hi Andrew
>
>> It is not permitted to edit the VERS clause for a version in a
>> release of Xen.
>>
>> Revert xendevicemodel_set_irq_level()'s inclusion in .so.1.2 and bump
>> the the
>> library minor version to .so.1.4 instead.
>>
>> Fixes: 5d752df85f ("xen/dm: Introduce xendevicemodel_set_irq_level DM
>> op")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Ian Jackson <iwj@xenproject.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien.grall@arm.com>
>> CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Chen <Wei.Chen@arm.com>
>>
>> Critical to include in 4.15, as this is an ABI breakage.
> I am sorry for the breakage, I admit I didn't know that
> "It is not permitted to edit the VERS clause for a version in a
> release of Xen."

To be honest, its not Xen specific.  Its any shared object with a stable
API/ABI.

It is explicitly fine to bump the minor version to add new things, but
you must never change the ABI of one which has been released.

~Andrew

