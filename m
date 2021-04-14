Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DC935FC75
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 22:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110819.211708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWlxF-00020f-HT; Wed, 14 Apr 2021 20:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110819.211708; Wed, 14 Apr 2021 20:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWlxF-00020G-EF; Wed, 14 Apr 2021 20:17:41 +0000
Received: by outflank-mailman (input) for mailman id 110819;
 Wed, 14 Apr 2021 20:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWlxD-00020B-Iz
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 20:17:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d411bc6-9903-422a-ab00-631b13764300;
 Wed, 14 Apr 2021 20:17:38 +0000 (UTC)
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
X-Inumbo-ID: 9d411bc6-9903-422a-ab00-631b13764300
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618431458;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jbJcSC9Y49rd1Hmt+KGMvpYwBg/ekPhNi3SKFXx5FQY=;
  b=aK43B4epRmAXl4esGVMPgaCsMRa6taMP2yjHhI4AJWxHzvbKupJZe+vs
   RuK/lFhZDegyYTVvSdJTzK+1thozogVVIFyuR1hmb927yP30nkAB89MRq
   Swwsu49NbTg0vZmRdq/dXngS2EYxlsuhhwbhebEZZ7XWJp9F5kOor3qFD
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3rE2lE+2ixL/GAICBPbjoyMbDVOOVP0gbyqerQ0ubUSZPjHGMkzMGTfW6mB2h55RvZUat1bPuQ
 q9K1rN3JGKh9ms1x0/NHLwrHpFJgsob58f44E+duxjkhdrM0W6jU0zObQOwL/O8eLbJrAaeD8s
 O45GVLItZqy0AU+Efm9OLelBtDzk7gxi2wNUH0ih2FyvUY7jVipIaFMIBtBMaCc9xr7SNO74Tq
 /HVJz6c/OBzUSExKpWOp6oKDhOe2FCDWQzprAj/fchz+A5gOfleUrG2w7muClik8ETAx/mugj9
 RaY=
X-SBRS: 5.2
X-MesageID: 41618010
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9qlpYal8rLd/uwNU/n24GB/rlNjpDfOnj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW17LLA+E4
 eR4dcCgjKmd2geYMjTPAh6Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLA9n67Ek7G
 TDjkjF9ryu2svLtiP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUbZ5SspzYwydvfjmoCsN
 6JmBs4OtQ21nW5RBDJnTLI+y3NlAkj8GXjz1jwuwqQneXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znms7UeNham9azhQmkW5unYkm+II5kYvNrc2U7NNsZcZuHpcDZZoJlOI1KkcDO
 JsAMvAjcwmCG+yUnaxhBgL/PWRRHgpWj+JTk8e0/blqQR+rTRSyksVw9EnhXEQ9J4xYIks3Z
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
X-IronPort-AV: E=Sophos;i="5.82,223,1613451600"; 
   d="scan'208";a="41618010"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRq1RIDMKsAL3LXh9mEW03E+0RlzIpb5s6G1TBgKsLZBUpSm9H08PElq3KlSVB8V3POPnt5PEs4jkQ0/ZNWF5nC0/OiQ/+8qaOoa2wW0yTnCFrnDRqxG92BO/SxKRXmlM6UfNO4kyXC0OLVzpxkqJ2Z0644bxcCj2nulFBOV1oLLBDusfVUJYultX0HvWZcee8r4YA7PQKvdTzhqa8xZKr1MJZ2DaR1XyOTKqMt0lzOaWtBxPNxxLamDaIfM4lK1rTX7EerqsVzNmb178PqUoQmAKWpu4duFabuR/uql7K7jYQBtOvb0sSjvDi2C5O5eQtHdeJFyEt9M/71/o0Cavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkeqm/sH7FYDWFyVdqLE9SnwERsA0fQfcUkhFvqRAco=;
 b=eRq7Oqe5BuSoBwEv4JTyydvhiQ3EHVMSCjxIXHA7XS868w1ZL/ha2RjBEJ4/cfbXaRteXeu9X4N8yjh2M1BlzEXw80mqEdW04jwE4rkPT2kSoKV4C0n+26IBA4nXCTxpc32IMBPSlif8dSvcWZGVdVNZPfOn/ar6+Cs5aml6/pgkuk0agqYKkxZ/3eQHDuwR/+cCqQcmYpgZ6WjapGsR6Omxkvv6KfOnUdvJl0zGL3HyGS3H/hWJukzsGzkpTOXo6mlHQRHGxVTRSW+6il9ggUib3bM3LEluZBmovn0Ol9qfTtChThRWMk0ZI9G2BL2BXmjKpkTZeJLrDbQemazqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkeqm/sH7FYDWFyVdqLE9SnwERsA0fQfcUkhFvqRAco=;
 b=bOtNI4DGqF6hDMfBv2wpa4Qy/JB/JUPQkwT7l6IDst6Ck3Yg9EgegU8je6xbi8hhRyvB7Ikbg92grDUGJyWnY0DP6t5EWhUXNnuOT825V3NkGaazz69//VrlNVw10luTFV7Q8dgGFg89SCylq6P8jYL/FNOd6zPKRTVyXYTDPac=
To: Steven Rostedt <rostedt@goodmis.org>
CC: Giuseppe Eletto <giuseppe.eletto@edu.unito.it>,
	<linux-trace-devel@vger.kernel.org>, <xen-devel@lists.xenproject.org>, "Dario
 Faggioli" <dfaggioli@suse.com>, Enrico Bini <enrico.bini@unito.it>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
 <20210413114614.4971caff@gandalf.local.home>
 <094c4b3f-3988-c51f-3a69-cfbc8d6a45bf@citrix.com>
 <20210414094300.7fbd6887@gandalf.local.home>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
Message-ID: <f44f994d-32da-0610-57d8-e3a30bbb278c@citrix.com>
Date: Wed, 14 Apr 2021 21:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210414094300.7fbd6887@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff63a021-f833-4443-9155-08d8ff809957
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5757:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5757A13308F21EB0D6833C06BA4E9@SJ0PR03MB5757.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EBD12tgaZMQeXZUJRBGP61jqlFtBTH0/j1aN/d4MggU63k7oBY7vg1QOhZn8lzAvzah9k91ixzzxlo1yoZB2Mhby3AnSRpw9vDU9/3Ked5co2jN+MRL3Sqp8yU2KtvR2ZjUfHn9ITcNw+poslgEQq2jpWXMqHr6T1JlbAAYh1z27pm4WjqTsW6lkRBIsvOrOBRMLvdg/Sbi+/Sioemx+daCZihuLrcBTRQLt8b+1LC8bydNO3JPCxZYLQRBJmIA4OEPZcIJoQsAn79WJ5pg194wwHYec2DqpA773MjScvxIOJ1UyXU8UskBrn0uUzVs4S39/1VkfCUh6dJNNU4DDSqGxAWfpNXX9MrdazEKdJl8NRi32WT26Azg5FMWtLSWmVzP8pvHa0MtK0SjeB3TYaR5x7EfVEcsDUnL3kKfGE7AGgfNgvA5yOvY/tLkSdDmSuKQS2rI8gZAUlo1sO1M5gOMiNtDl+nS28prY56cx9LF7Si9OXwXaRcJ0xJdsVGrm1PvzqFYfcCg/dL34kmn+5Q7G54gcsge7buQGvcnSoVRJeuMZmcsTyMbtB/chMBHqtn23f+fbyQ6ZL/9sXvi7sKoRJy/HftEQjXOYAC1+6ALJrtZhrxCPfbWyKBTx5LRYmtmYyX/aaH7MCmXzuvB0hWO3WpJN2xmX/Nufjqt9sxqoinpM6etSXasrJerFeqWQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(26005)(66556008)(66946007)(66476007)(66574015)(36756003)(186003)(478600001)(316002)(6666004)(2616005)(16526019)(53546011)(2906002)(6916009)(31696002)(5660300002)(956004)(8936002)(83380400001)(38100700002)(86362001)(16576012)(54906003)(4326008)(8676002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmcvdW5uaFgvQStLS0MrcXp3eGlibThRd1V3bUlEbmVYNmlESG5TYWpyRWlY?=
 =?utf-8?B?a3pGOHBpaHBFdWdiQ2JpWTd0UHJDTmFEcXlhSUdSN3BlK0RQZDluZnRuTm9P?=
 =?utf-8?B?N3hxaUZwTlNsSnRNdW1CeGtEWURYSWhVNlhzb0RpRitUdlN4eVJobi96Sm0x?=
 =?utf-8?B?ZlpxNWN4dENTclg3SS9peXBaMEFDM0JtajUxelN2Mk5jc3hET1FxM0podW5k?=
 =?utf-8?B?czNIOGxsSllsVjc4Qi9nZGpCcUFjbWFaY3U2R25zVFliQnQ4OXliRzJYTUcv?=
 =?utf-8?B?R1R4QmNFMkU1WVdMYjA4NjBYVkhaeUIrKzQ2T0FNZk1nK2VRMHN6KzY0WWJN?=
 =?utf-8?B?MUdWa2Z1TVZDSitSZUF3WWpyK0UvaDdZRDFSQ3duR1puK1lKKzV3ZVZ4TW1D?=
 =?utf-8?B?S1k5bnhDWXM1c2t0ZHZ6a2RuSmJ2MFBYSUNML3hWLytkYzFZQnVLSFJKeGZq?=
 =?utf-8?B?b2x6Skd6aEt0aXhtUGNzWWhpKzdFZlE5c0Q1TlRDWnZoc243MzZ4MEFmcy9v?=
 =?utf-8?B?S0NyeEpvdWNxc2d4YXdTUEJNRStxOERVSjBzQ3plV2lKUUdjNW5iMHRDVjNt?=
 =?utf-8?B?MmI3S3JGN2N5cmZUYk1YQ1J0OGtza1J1eWlqTkcvbktOZXdMUnowaDU4Lzgy?=
 =?utf-8?B?MDBLblRtTWNGVzVkVStKWGtraU1VNDc0VFNGeDVKblJxL2djeGpYNEI4dDdF?=
 =?utf-8?B?UVFmT3dlRHU2UzVHNGJEdmRhQi85Nmx0RU5lRy9uQ3pMWWRIUmdxc1FWSkR6?=
 =?utf-8?B?YjhSVVNKcDVmdkpqeHhHOThtM0RmV2NwZjhjSjdFblMvKzl5YS82RG9Kcm5Q?=
 =?utf-8?B?NUV3SmNNaFBSbzZ3VXpiQ0EzRmpESXB0WVlQejNyeURCalphTDY4QkxvdVZn?=
 =?utf-8?B?LzNHUjRiSG5PaGI1Qnl3Zyt4TDQ0MlY3MC9ES1dDRmtqU3dUeXZFNmJvdVYy?=
 =?utf-8?B?NmpnV0s1UFFqSE1Sb0drS1hrSHkxbGphVWxwSXRrRjR3REhZVjJiWUZXalNI?=
 =?utf-8?B?SExZaXh6OC9ZUysyU2RmNStxN3lnMXBYTk40cEJNRitkZXRjbk4xQWNXWWxs?=
 =?utf-8?B?MlpPTHRRc2pmcDR6dGZKU3k5V1JEUE5ZSGRtcE92ZGNIUkxoMHkycmoxRnRD?=
 =?utf-8?B?YWZCeE00bHF1aGQvd2x0a1hQM2JpSXIxWGZGMlY1MmpBN2I2OE80dWVXL2Qy?=
 =?utf-8?B?RXZqQmN4LzZTdVhRNHRFTHVPTHoxZXZzSVBINlAwM2M4U1M3RTlnR0VXMnpW?=
 =?utf-8?B?YytuaGhWRnNDd0lmY1FMZHlIZUhQcERlemJyaEZRUGZVTTJUaEFtaEU0L2dq?=
 =?utf-8?B?VHBmVWM2TERwSStqR1pCMVE5T01udEd4eFRjQnR2WnU3T1F3NDZLYmRjTWd3?=
 =?utf-8?B?YkRWYU1LNlYzNmJiMmR5WVNGM1lQRENJUXY0S3FkeVJHS1c1bGdndnMxcS9R?=
 =?utf-8?B?TEtuMUdYTldyQ3cycll3b092MXRHNDVnb3NvaGxuck5MQ1E1czlhV2VidVhQ?=
 =?utf-8?B?b2JqYnAyVVcrZzBabHBHYTRiMWJvUjBtZWQyU284VmJ0RHNCamFKNXNyWEcx?=
 =?utf-8?B?UUNmb2JvOHZkTDkvM0FtODZWUG11ZnEydEpVMTQ2SGVkYVkxVzFldjRROGRL?=
 =?utf-8?B?eTVUZ3k3NHE2VjJpbTNYM3ZDVEhQNDVGSTU1dmVscC9LWHlCUDhqamNINjZ3?=
 =?utf-8?B?dkZhNUVlWTNFYUkwNjJCN3plOFUwd0xVN29ZWkluR0FRalBtenllRFdXUy9w?=
 =?utf-8?Q?M8CidFbHmJsHU7FPjCO8NToXQwbnrurECzHqb6l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff63a021-f833-4443-9155-08d8ff809957
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 20:05:06.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BVuJbJv+z+/5wAmYZvix2eU7ocDoLHuYoCC4ltEaXCkeGbL4Lv4vkll4hUti/rQw0sU8REcAWXy5l2DaotIuJjpV3BiMqifQpeJK99KF50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5757
X-OriginatorOrg: citrix.com

On 14/04/2021 14:43, Steven Rostedt wrote:
>> This causes major problems for `perf` support under Xen, which assumes
>> that the kernel's idea of CPUs matches that of the system.
> Things are different with KernelShark.

That is very encouraging to hear.

>> When rendering a trace including Xen data, Xen can provide the real
>> system CPUs, and dom0 wants to be rendered as a VM under Xen, similar to
>> trace-Fedora21 in your screenshot above.=C2=A0 (Obviously, if you're doi=
ng
>> nested virt, things need to start nesting.)
> Right.
>
> What I would envision how this would work, is that you would produce a
> set of tracing files. One for each guest (including Dom0), and one for th=
e
> Xen hypervisor itself. The trick is to have a way to synchronize the time
> stamps. What we just did with KVM is to have all the tracing record the
> CPUs TSC, including the shift and multiplier that the CPU might change fo=
r
> the guests. Then we have a way to convert the TSC to nanoseconds. This wa=
y
> all tracing data has the same clock. It's somewhat complicated to get
> right, and requires access to how the guests clocks are modified by the C=
PU.

Hmm.=C2=A0 In the past, I have had success by modifying Xen to refuse any
shift/scale settings, at which point VMs and the hypervisor have
directly-comparable raw TSC values.

Xen certainly has enough information to describe what TSC rate/epoch
each guest is seeing, but I doubt any of this is coherently exposed at
the moment.

> For KVM, each machine has a unique id and is stored in the trace.dat file=
s.
> We have the host store a mapping of what thread represents which guest VC=
PU
> (virtual CPU). Then the "-a" option tells KernelShark to append the
> tracing data as a dependency. I would imagine we can have something like
> this:
>
>  kernelshark xen.dat -a trace-dom0.dat -a trace-guest1.dat -a trace-guest=
2.dat
>
> The Xen plugin would then need to read the how the threads in xen.dat map
> to the virtual CPUs of each of the guest files. Which would give you the
> layering.

Looks good.=C2=A0 I suspect we might need to do a little work on Xen's trac=
e
data to make this mesh together nicely.=C2=A0 In particular, Xen doesn't ha=
ve
a terribly good scheme on unique IDs for "a VM".

We've got domain ID's which are Xen's unique instances of a running
"thing", but they change across VM reboot/migrate/etc.=C2=A0 I suspect we
have some atomicity problems with unique identification information and
VM-fork too.

There is a UUID field but we leave that entirely up to the toolstack to
manage.=C2=A0 (A good test for naive toolstack code comes on the a localhos=
t
live migrate, because suddenly the toolstack is presented with one
logical VM (=3D> one UUID) and two concurrent domid's.)


I'll try to have a play with the plugin in some copious free time, but
this work does look exciting.

~Andrew


