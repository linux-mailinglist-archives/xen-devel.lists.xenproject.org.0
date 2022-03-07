Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2EC4CFC9E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285846.485111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBRc-0007V7-PY; Mon, 07 Mar 2022 11:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285846.485111; Mon, 07 Mar 2022 11:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBRc-0007T1-MI; Mon, 07 Mar 2022 11:22:28 +0000
Received: by outflank-mailman (input) for mailman id 285846;
 Mon, 07 Mar 2022 11:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRBRb-0007St-Mh
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:22:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc411050-9e08-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 12:22:24 +0100 (CET)
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
X-Inumbo-ID: dc411050-9e08-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646652144;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=v8ED+sWHiTnVDmj1QKiR1RGDygoNVQSZNn2gG3rhs8A=;
  b=MWzz5Sb9u6/cqRX0T+TMU5vlP9pSfkIz2fIKO/Fmj7ljHTCRB6oV1Jmp
   o25ZI0C8NmCiB48YemK+50A1E6RKVzUOMTRDOOzsrtJ2Ax61XAfdCS9xY
   +WJ8e5j3QxHVtFs5vpusWcS4D45yQIXYT2X2oj77xThpi8i/oBY9NLR9H
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66001880
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oSpE0KAjBV8dyBVW/wbjw5YqxClBgxIJ4kV8jS/XYbTApGsh0zQBx
 jYWDG3Vaf+OMTHyf4p0PY2280sOsZOGxodlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhd8
 fVPh7bzZTwUP5Pxm8IhaBljIQ5xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgm9o35AeRZ4yY
 eIfcmtIdTPpPyFpFVYKGJcEraCYp37GJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ//hmmlCagHcPBQMfU1KnptGig0iiUtRZI
 lQV4SNorLRa3E6iSNXnTgC7iHGBtx8YHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC+
 mapneHDRhBUjbyrdHG7yoyUlgGdNn1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsWRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTQGo3h/5nzvp5p1QEwZnY1Q/EcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MpPtPvU5txnfi8fTgAahwzRoASCqWdiSfdpH0+DaJu9zqFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5cPJ77bf1E/QzlJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:QZ2nc60yuvHFcFFUdl4WwwqjBVZyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdLz2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P70rhJJGdZQ8qPSMexnwqDL3QSuvyAfcZek600ykke+C3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="66001880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsSy0+YoDD404rgR65IJVEFv7hNGuRfQ7crtIkgCc/nu6Ownp/HqDyAZYO16yK/Sk18OBEGP+15fVabKYpiQIZf8UkJRm/I9NwM4xtKKfZLUbycyQn/iNYa6RWWduh5XH4E3vMpmBcR7EqHFyxUOgy1uCcjiKyg69ejeWBEYhJdC+H5E3soVCGFe0cKWNu+PaDkK+VHhy/IGYyLoDn32AnBc0ypNjHvqLmzKXw1fQuZhoq2K3Q4H2WrkHQGTOCAILLjnxWcLoUYrY9xJtVVuXG1E+pfnTfjETyT8u3WbaI4iWBzYsNupV2uec+g6tXML6eU7B3u2CnJmh38a3eGDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGHKQIQOA/JCYeaWyXITFiv4iuN4k7QMJ/nbrCj+b0w=;
 b=gynSsbbgmhxMFCO1IaC9Trbw9o7KWD+vf+fTQJVZMG7KQhoGgc9GWDKY0WhZBJjZ2rx2+hgn4ig0/CMDJeQkrIwxIJFgMEl8isDmJ3ILBxgfU+8WWdObOLohKYcOkqygM2uait0lu5kYjiVyVYCtZdvj/OIDvPvvUXdXH9eAp1hIaML1Cqza0t2v2ZmdM1cviDQUYK23uTPVp96YOAwweALiKtfpBl+oz0l5bs4JcbMOexGmWqltSkceASyuwSwaEcpmzAV/AojvPcRNqtj5VeCYJYNooW79zafQZsLHicHDAkloxDjiqw70LtSM0CplzwQxIm8ZbbCq92IZQlR+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGHKQIQOA/JCYeaWyXITFiv4iuN4k7QMJ/nbrCj+b0w=;
 b=YItbGAKrpqm9rggpwzmWMz1auNIV0gPHsBEGZoUdHXCxaWLOeAWIwjcv//FH0MIBw7tC4clWgKz1rEL8FnEnZ0+Ebfd3SL4CJ8Qwta/au+Pwu0ua4DkvNkFbvsEvcLUXkngjlcHuZlpG0A7ft8Lt4lSSUZUqu+YFtKWCXOIQuAc=
Date: Mon, 7 Mar 2022 12:22:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
CC: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: Network driver domain broken
Message-ID: <YiXq5HIrvZsy7QKU@Air-de-Roger>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
X-ClientProxiedBy: LO2P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 449bdbf3-80d0-4b13-b98a-08da002cbc5c
X-MS-TrafficTypeDiagnostic: MW4PR03MB6364:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB636484537E8B53EC838496418F089@MW4PR03MB6364.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26dxMu9HyvYJ3UVDp3Dx1XMGYvlf8QkbUSEBKSKf32zkT0ag1AQgHXVU2t+Vy1t1lIcqplOA+YCZhzzKNvaMoh7Mx7Lie6ri6fgHaNUhb1616rIMdSyunEblXX2rzkhmXuSACE+xCNfOsmgzjJyP1aSfgKnPtS1rEEaJ5TL5P6Jt16A7pKuR6SLA4CfJpul822TCwn8pWWx/ywQl/Itny1BC+mGfOw3WkCkRcgCADNzP02wTHKgr+58QXtwk/sa0+8JTvV60aMz3KmntHAOoP0Lz1bCUYNvojSDl/oDagFcaowpZFWzZEkaySi4iz8uKiZyKI9TvA6ds+PW5ZXkmoz8NHkVoEt4mBFh7GUyAyMCXCOK/FgnthfBZcVBWnZuYAIP6t2JEMhyhhcF/Zr6bUxOskg9foMbdL1T9AXZLzxMwnBl/5zwPvOhPGqNPM0oiPwiWMXVmGo3XtvYzFhdG0zGrRMKPzSD/DdWgILtCEe+wOTceLLHYDRtxL+oV1hEdF+iZZthkraVBx6+QAePCgM0gPeUmwD/RoJq4LBniaxSAE5u936v1zJfTLAEIoF7GLf78eg5Zt5XIyhIoZzoSVDRNS8xFNlxlvSV1No+Z/YeYF6zNEs5ZXqMaCPtj45J8Qnou3p3qFK+WzucweUSYsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(6916009)(66946007)(316002)(3480700007)(86362001)(66476007)(66556008)(8676002)(186003)(107886003)(30864003)(508600001)(33716001)(26005)(85182001)(6486002)(53546011)(6506007)(5660300002)(2906002)(38100700002)(82960400001)(4326008)(9686003)(6666004)(6512007)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnBTVURpYlh2cUFyYzdOWkt4RU0yZTk4ajE4Z2JNb0F0TGRXZEZ0aW0rejhN?=
 =?utf-8?B?SnBqQ2RKVGhpUjNoUWp4bmR2c3lYRUZTSDg1TkdQcTZOUzFtMEViZm96WU5Q?=
 =?utf-8?B?ZmVJcU9ONkVVdXZvRWFPbERZOVhzc2VsU3JmL1JDamJDSnFBdmNiREdVa20r?=
 =?utf-8?B?SVVhdnlnRlQzZ0FvOXN6SUJ3Rkk2SURoSmdDWE5yeUx0enJTam95djMzS0Mx?=
 =?utf-8?B?MjE2TUJ5QVJQc2xtc2dRQ3VoMmNua0cySVhMSE1QYkx3YkppRENVVVlQWEd6?=
 =?utf-8?B?bjZxV09zcDZWNjh4YnpLZC9qVjVpWHBjbVI4ZU0wNHl0K2ZINm9QY09IM1dW?=
 =?utf-8?B?WUgwb1JzbStZaHVBSHdhU1FNa3BpZjY5U1dEeW40L2FmdnFXUUFLb3BDdU1G?=
 =?utf-8?B?aUg5RnhRNlhtS280MFJCTkVkNFBUYjNqcEZ4L0NudnhhZkRWZVVoZE96UUlP?=
 =?utf-8?B?QmpDWC81WTBvclZ0OXhRSGF5OThXVEVIR0JJN3lEc21kZy8rbmlEMDZSai8y?=
 =?utf-8?B?bG0wR1RRWkdiek9ibmJlYXFSZVp3YVBCSUNxRTVRVVczNi9xYk9PYkVhL0ZD?=
 =?utf-8?B?RjlDd1ZNMTBjMEZIYnYrZHRXQUROQnFFOGtmR0xaUlBqY1g3bGdYZkRyRXlL?=
 =?utf-8?B?d2MzeDRmaGJ5bkdWb25LYlBMZ2JUc2NWemVZaE1HTGpMT2xqNk93V3pxWWxV?=
 =?utf-8?B?WFhOVW9yVldhNU91K3RoTWhRZXpBZWdUUHNsNGZFMkJxY2dnUTFMaDdmUW1y?=
 =?utf-8?B?QUhjQkZwZTVCeGRxRGhuZHFTcTJFVVhqeVZUVGJEcElka3h6Mnpid3BKOTZN?=
 =?utf-8?B?RkZTcmlQcHBPZDcvVWptbmZPTm1MdnluTEN5MHo5RDdXQkgzeEdNUWNiMXJF?=
 =?utf-8?B?bkhucEMrOTQ5NWYvUWQ1R1R4aHpjOWM5VXJSd2lTZ0V5MDVsZnRvWXR4ZTVM?=
 =?utf-8?B?Wjhjbit6ak5WWHE4aWlQMTdKMEg2RFFJTWkvTGx0Nm9zTmpPVEFrVGdPb2pp?=
 =?utf-8?B?YzY3b29yK3hJUVk4WTZyaTE1MzZBcEpRS2RnU3pyZFFLclRrQkxLeXdkRXJz?=
 =?utf-8?B?MGU0cEFER2g1ZVZqdUVQWlhmVG11Nk54VnVCMGZrUmNxNFo1cDZ0QjVxRzQ0?=
 =?utf-8?B?dUNEYjk2U1BJV3lhUzJ2b3hDUkk1RG83cWRvTHFlNnppeFQyRXNTN0VsTmx4?=
 =?utf-8?B?aWZ6RFJHZEVzaE1DZXFnM3p5b0U1bjI2TG14dG9uS0M0TXB1a0NTcTJTdW5T?=
 =?utf-8?B?L3ljOWZTRnZXTFkwUHl2SUh5UjEwRC9ITm9IaGtuRDJTQmgwbkFVbFJiSkFv?=
 =?utf-8?B?SDlPNzNFU1hVbElxVzBRMEhGL2NLRWQ4V0ZrV0RGcGEwQ082bFYzdUhzbkE2?=
 =?utf-8?B?VzA1TnY4T2xEWWdCNzVCNHpKa2llWTNWQjFtUjFHZzZxbGVPSHd6eVJyK0Fp?=
 =?utf-8?B?MjNKMUJET0VRWjJoSG80ZkhhTm1IRkFoSzhmTlFGNzVUN1NwaUNQYXdFQUtB?=
 =?utf-8?B?YUY3SzQzcDk3Rjg0a2EzUGRVRTdJNzFHNW53c1hHZ05ZbjVGOTlRbHYySFc0?=
 =?utf-8?B?OU9qOTRLWE4zOUJiTzY3WDdwZXNBSTFuZkJOcXhCYXNEQmFmT3N2b3hxYkZ4?=
 =?utf-8?B?VUZQc3IrT3VFdXYwaVU2RGVBVElVM1h0Z3A5NUd3ZTRwZjQvNy9hWk9ha0Rr?=
 =?utf-8?B?MU1GTWl5eDVWNWgxbktLcXY4MHA2VnArZ1poSFNjZHpDR3VqUmlOYVpweWVi?=
 =?utf-8?B?MU5CaUZHclBaQkF1bWtiUmhrMDFhQnM1bEQ2RVpWNmFoSDMvNDQ4SWJQcmFN?=
 =?utf-8?B?NzcyR1hMbzN6MGdEUFpmdm5pQTZuMXJjTWErK1EwckdXbGhuU1paSnlONjdW?=
 =?utf-8?B?U1JwMmhkN1hkWHpzK3Z2TE45VEs5U0lvVGRZYndkVWhNVkUrT2Z6Uk1reVN4?=
 =?utf-8?B?Y25wVVpIMXNJNThDMkt1bm9MS3h5MVBaMlI3aitnaU5EeEl0WjlaKzNoWCtp?=
 =?utf-8?B?Z3FqQTJNb0RERy8vcVFCSVlPK1V2ZllMb1BSQ0p2c1BUQ1l2OGFydis2WjQ4?=
 =?utf-8?B?U0NhM050UWhiMXhJOGYwNTRoeElMSUVXRnFVbVlwa09rSWJuQlhSTWo3WStJ?=
 =?utf-8?B?N1ZhcjJ3MnFPQUwySlI4TEpPU280ME1XVCtzS0hWYU5Za3J4bk9HWWVFUFB1?=
 =?utf-8?Q?Bm5+OG5QUvviy4auPd5KZus=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 449bdbf3-80d0-4b13-b98a-08da002cbc5c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 11:22:16.7601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3S7mVsKkt5rK76AqmnA9kpQBzOXFrYrpRaWdJdjv8WE1a23JO4dnEu8B6jY4t26w3IN5uPA5Gu3jrFPbarM7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6364
X-OriginatorOrg: citrix.com

On Fri, Mar 04, 2022 at 02:46:37PM +0100, Andrea Stevanato wrote:
> On 3/4/2022 1:27 PM, Roger Pau Monné wrote:
> > On Fri, Mar 04, 2022 at 01:05:55PM +0100, Andrea Stevanato wrote:
> > > On 3/4/2022 12:52 PM, Roger Pau Monné wrote:
> > > > On Thu, Mar 03, 2022 at 01:08:31PM -0500, Jason Andryuk wrote:
> > > > > On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > > > > 
> > > > > > On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
> > > > > > > On 03/03/2022 15:54, Andrea Stevanato wrote:
> > > > > > > > Hi all,
> > > > > > > > 
> > > > > > > > according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
> > > > > > > > 
> > > > > > > > What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
> > > > > > > > 
> > > > > > > > name    = "guest0"
> > > > > > > > kernel  = "/media/sd-mmcblk0p1/Image"
> > > > > > > > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > > > > > > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > > > > > > > memory  = 1024 vcpus   = 2
> > > > > > > > driver_domain = 1
> > > > > > > > 
> > > > > > > > On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
> > > > > > > > While the second guest has been started with the following cfg:
> > > > > > > > 
> > > > > > > > name    = "guest1"
> > > > > > > > kernel  = "/media/sd-mmcblk0p1/Image"
> > > > > > > > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > > > > > > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > > > > > > > memory  = 1024 vcpus   = 2
> > > > > > > > vcpus   = 2
> > > > > > > > vif = [ 'bridge=xenbr0, backend=guest0' ]
> > > > > > > > 
> > > > > > > > Follows the result of strace xl devd:
> > > > > > > > 
> > > > > > > > # strace xl devd
> > > > > > > > execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
> > > > > 
> > > > > > > > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> > > > > > > > write(2, "libxl: ", 7libxl: )                  = 7
> > > > > > > > write(2, "error: ", 7error: )                  = 7
> > > > > > > > write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> > > > > > > > write(2, "\n", 1
> > > > > > > > )                       = 1
> > > > > > > > clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
> > > > > > > > wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
> > > > > > > > --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
> > > > > 
> > > > > xl devd is daemonizing, but strace is only following the first
> > > > > process.  Use `strace xl devd -F` to prevent the daemonizing (or
> > > > > `strace -f xl devd` to follow children).
> > > > 
> > > > Or as a first step try to see what kind of messages you get from `xl
> > > > devd -F` when trying to attach a device using the driver domain.
> > > 
> > > Nothing has changed. On guest0 (the driver domain):
> > > 
> > > # xl devd -F
> > > libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> > > the maximum number of cpus
> > > libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> > > the maximum number of cpus
> > > libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> > > the maximum number of cpus
> > > [  696.805619] xenbr0: port 1(vif2.0) entered blocking state
> > > [  696.810334] xenbr0: port 1(vif2.0) entered disabled state
> > > [  696.824518] device vif2.0 entered promiscuous mode
> > 
> > Can you use `xl -vvv devd -F` here?
> 
> # xl -vvv devd -F
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> the maximum number of cpus
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> the maximum number of cpus
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> the maximum number of cpus
> libxl: debug: libxl_device.c:1749:libxl_device_events_handler: ao
> 0xaaaaece52130: create: how=(nil) callback=(nil) poller=0xaaaaece52430
> libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
> w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: register slotnum=3
> libxl: debug: libxl_device.c:1806:libxl_device_events_handler: ao
> 0xaaaaece52130: inprogress: poller=0xaaaaece52430, flags=i
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece51b90:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece51b90:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4e7b0:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e7b0:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4e990:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e990:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/frontend
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4eaa0:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4eaa0:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/frontend-id
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4ebb0:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4ebb0:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/online
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52830:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_device.c:1714:backend_watch_callback: Domain 2:Added
> domain to the list of active guests
> libxl: debug: libxl_device.c:1569:add_device: Domain 2:Added device
> /local/domain/1/backend/vif/2/0 to the list of active devices
> libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
> w=0xaaaaece52a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1:
> register slotnum=2
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52d50:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/script
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52f30:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece52f30:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/mac
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/bridge
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/handle
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/type
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-sg
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-sg
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
> destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
> wpath=/local/domain/1/backend token=3/0: event
> epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
> nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10
> wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event
> epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:1055:devstate_callback: backend
> /local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 5

There's something wrong with the negotiation between the frontend and
the backend AFAICT. The backed switches to state 5 and 6 (Closed) so
the connection cannot be established.

Can you paste the output of `xenstore-ls -fp` from dom0 after `xl
devd` reports the timeout?

What OS/versions are you using for the guest and the driver domain, do
you have any local modifications?

Regards, Roger.

