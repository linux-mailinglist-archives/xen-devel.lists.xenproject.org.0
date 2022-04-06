Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B6B4F5AE3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 12:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299812.511031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc349-0002uc-2f; Wed, 06 Apr 2022 10:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299812.511031; Wed, 06 Apr 2022 10:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc348-0002sB-Tr; Wed, 06 Apr 2022 10:39:08 +0000
Received: by outflank-mailman (input) for mailman id 299812;
 Wed, 06 Apr 2022 10:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc346-0002s5-V9
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 10:39:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c68394bb-b595-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 12:39:04 +0200 (CEST)
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
X-Inumbo-ID: c68394bb-b595-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649241544;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4S/+eRG2N7Nmm4j4XF0jaSlzIqfZoycjiY3YRSZ8Mz0=;
  b=hO3qIf0uHTkS/r3ATs91tdkHZr+PEbTjdiaExe54vrtpEgiTQjpFRW+Z
   5dFdtFThYFzTgmuKomblCy2MNx2XCJoAi++svKnAHnwkgqE+J/mzdnRUT
   ISo4bV/YKaXGb2+18bAnvYcz81t9pJrk0BhsH6imFFUtnE3+M1Cq+nhmG
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68156689
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CMDIdqCTtukWpxVW/z7jw5YqxClBgxIJ4kV8jS/XYbTApDgl0zIGm
 2sXWGrTa66CNmakLdAiPNzj9RkG68WGmN5jQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jh3NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhxz
 uUOu4CoezxyfbeWmskCFBRaLHpHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjG5t2J4eTJ4yY
 eIwMRB+bgvDUicUYHQ2BLMsuc2h3CnWJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiH6Cjl0SR8JiKLZ58luP57WT7gSmXVFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94acu51qXHb4
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSLyJNAMsGEudBgyWirhRdMPS
 BWN0e+2zMUNVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5DTkU8CD7SiPHK/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:HTulkKBoo4SoatnlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="68156689"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWdG2bG2MnbjDImoACqCzsnsl+O/67lQhfTEKAdWLoBnq7W2wq5k6k1wRIpN0/YuELDiC/yxZfGPJN71t55hyYVrCLnwb9hePaiJK1/cHj42h2M6m7Q53K35K2evrvNlxlQADt/bTnLQ5rMoEFBWl3dRnMMrm27FqoxoeHpyuwiQoYhw1+IJI0CFff+3EYkzzpINavgrdgDywMPyX6tdJJwv4+xsVkUvhts/C59KFIhiT5buOApWiHNNS6LJlO4ATKu4aZlto5fduxRd204IlkflWPr9U80TRMqP6viFORN6SUEnpzIz8EQh/hNCdqqSZ6mYEjj3EVcFpROOA4y04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+d+bucWvrqZCnG9AHgIGXShQYWJ04fo3sm0QilA9wIc=;
 b=DGde4BHp8uojqkciw9vSVW5dhwWwIYmgNJaTVn7yqQRk9XYO4Ac9uZpBefDXkRwtYdO7B9gkub7ENk7yFqin0vYzWU0qVSnNgPjyzCLBjlNzg7nxCACo4qeX4bTXObaWLQo5Zs5o+7cbpwMuQWIX7Poffp5cIlZVGOUCXCQZ0LajCihtiHZ7BZejYukllQRTJUQJPToEdfpXyxugigp96oNnbi1t+TPZd1DFf60ReeWriOFmtAYIm2V7mo2wtd7Egz4FF+y0bd4R39G58ztI/8ShaUwftj2C4p2uIsEA7GQn1ak9KRKp9+6vnKOikGQvWqnn20th1S6N1LDVhxO1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d+bucWvrqZCnG9AHgIGXShQYWJ04fo3sm0QilA9wIc=;
 b=oTprLsIRawtDFL3XDWtnVm2bpsIXqkUA1TDw99p1Dfp+XezMlFC1pPZmMiZrfSexefJZId1OOASmiWnhsByy6PjpU+jmgl95aL2avs5iQ3nQ4wcX0OB3Q7EXkpVotP0hn+Mh+85eFBCRt7xiwihZLtCJctm+QumM4beQbMC+LhI=
Date: Wed, 6 Apr 2022 12:38:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: Questions about Cx and Px state uploading from dom0
Message-ID: <Yk1tvf7oqOf3jySX@Air-de-Roger>
References: <YjrgQOYbsaYOV08H@Air-de-Roger>
 <6a029529-fcbe-3923-26a6-58a58926762f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a029529-fcbe-3923-26a6-58a58926762f@suse.com>
X-ClientProxiedBy: LO4P123CA0311.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aae96905-ef73-44b4-3953-08da17b9a849
X-MS-TrafficTypeDiagnostic: MW4PR03MB6868:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB68689CB23D670912FB9C14A08FE79@MW4PR03MB6868.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISrP5ejSEW+sX+fT7y1GpAiJbIYo+1e3XtQYCYHUpz7VkeQa+3QYU+HiBkAeFCCYA4/g5rKjOcmikkN/L6YeylT1hQym3tB1czDJ5xN0+6Ron/LCLrRHoul6XoG6oybVefT0OoHTSgd7H4ePXh/Dqhq9hKtlgIoRjELDL723BdHbx4wVbGspOHKAFRzQFb9jshcK0J5V8wRSsmzyudVYzRLMc2NTFSUVkpwrimsYCBf8PuOhNxRSVUDqOOOp4rCOgmYcaYtcdS9HDE56XrwVdS7ybRk+rxXK3flmQ4lrnX0Pz1kjqXK9vzCXYJf14Ovpjq6OU7LEHSFdQHfr5O1Kspm+ZWOVOz+bOvlvDkFLomCJiv6CsP1ZxqsPOxz79/PlyjCakIyOUzPHhMk7j0UelEQI+EKJlmL8JdcGSR4NfuAB0XEDl+Srs3Oo+daOWJgcGIRcphcpn5ZxbfqysxA6yN5CVpbIn3jX4KuaTmCY9UW9mdBaKjoaHlzg62cFd0NmeJODDpvHzJAGd675n5wE4EQ4jIoglVv7rBcVf5FFqI8LX44Puy1xv+zW3AB5I2ZXUNXWSzwBO5uMj2cuNjmhzB7RTG47ehFbjm7BLKiCyRYmHx8/3VYkYf0eeUl+keHH7j5uembiOBCz+EfYZWnbSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(4326008)(8936002)(66946007)(316002)(83380400001)(26005)(6486002)(186003)(508600001)(85182001)(66556008)(66476007)(6916009)(8676002)(5660300002)(54906003)(86362001)(33716001)(82960400001)(6512007)(6506007)(9686003)(53546011)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ZMekZqR2ZWNUx3Y0tUK0R2OHNmODcvNXo3WlhRdHpucFd2RExDNUNSVWZU?=
 =?utf-8?B?VzJSN1BFRzNEc3k2Y0NTVkVpWlJybEdnNFNZRjRLUEtnRlQzNjNodDgxWW1R?=
 =?utf-8?B?VlNoRTRLT0JvZDN4dzhSTFJoSlB0NXBjb2piQ05WNHZBbW1qWVAyL0ZSV2RP?=
 =?utf-8?B?dnoyRU1mc1hRUmxPWVBPcHZ6RFVxUC82YVRGd3FuK05TNDRxUjVXb3RPK21I?=
 =?utf-8?B?Zmg3TThmZms4YUxIZExCdXBJMEpudDRTNHJSUUNqUWJNc2Y4STZwSElldjZy?=
 =?utf-8?B?TkJJYjd2SWZTOER0Z1VoZGYxdU1BY3JYQ0JjYzBQRHBjZEQ3Z0VVL2pHelly?=
 =?utf-8?B?REozSzNvVCtNSjcvcklPMS9BcHBXZnIyd3paT3lTQXJtZGxQTUxOZUc3dlZT?=
 =?utf-8?B?NHN1dWtuVUNpTHhuTXNCUzdGMDAxcWtpSEgxUUUvZlRxdjBSS1p5RjIrcU9o?=
 =?utf-8?B?aDlrcEFqRUZ5SEErK2NLQ3FEU1E3N1JuY0Z1V0VFbXlNZmV2c2xwQVZmb1Rw?=
 =?utf-8?B?VEszSkExeFNlZ0F5NVdleGZHZFNKeWNBY0RVaWIwcm5jUWVXYkZtUEJWT0pK?=
 =?utf-8?B?QnllUUZ3Mk5YU3RzZFJhVHdyZFgxLzBwd0lNSmRvWFBoV1hRNDR6YjU3RHhR?=
 =?utf-8?B?cWZUVHYzRUIvdXljdmswaHlIOTFyNzlSNHdKK0FJZG45bFB5QUN4czNqc1VU?=
 =?utf-8?B?ZjlTMEV6eml4VXcra2ZFWHJiWmdCNjh0RFdWYnJLQUVwdTFpempPN3dzemJ2?=
 =?utf-8?B?ME5HSXhuUUJFdDc4Q0xyM3VLT01DYnB6SjBwek5zQTNNbmthSVR5U3ZSUWR0?=
 =?utf-8?B?ZitoMFc2ZkU2VnI0aDIxOFY3eVFNMnBvcForcTU4M1VTV09tNmk4Z29pR0FM?=
 =?utf-8?B?UDVOdlRuL0l0djF1WWVVc3RiVnhONEREUnBmOTFBNE5SeTF1bmtWMXZ6Z0Vl?=
 =?utf-8?B?eVdsVUpvQmdHcmZ2cW44akFYVjNRckVxc3dmMmFkZkpuWnJjNEJ6LzFxdFNM?=
 =?utf-8?B?WSt5V0RLT0lWeDg3SWhzYWdwM0dTWVlUTDFSeU1RR04yRmlKR3VUSno5cGZs?=
 =?utf-8?B?bDIydUo4S2lFQk52YWJiU0gzL3lmSHEwVSt0VkNUU0NyTFNESE1TcGY3bXFh?=
 =?utf-8?B?WmcrVG9LRGJRUGRsTTU2SGJCdTBOTkdMQ3dheTFBb1VPcE9lWmdqTXo4U3Zw?=
 =?utf-8?B?enhOZStkcDVlTWpZUDN3OUFBQzNmTU8yRGsvSERMSGlVbFdlZFpHWjRNYU00?=
 =?utf-8?B?em5UckhnaEZyTGsvZGZ5dC9IMWVtZmlFUlU0T2dFUC9wNjJ4SGs0aUlzM2ts?=
 =?utf-8?B?YUNZZGNkUjZILzBQTGxwdSt5bXdCQUw4bEhabjRVcnZLNjdMMkNIMWExTUNH?=
 =?utf-8?B?UEF2cjRuTHFja0lTUktYbTBzMUR2eWFxdjBSOXBSQm9pSE16MXoyNzIrVDhl?=
 =?utf-8?B?SjQzNmNzRHAvNVRzakN4c2wvb1dYai9SeFV6QURTdlEwYkRjVGg0QURuTy9r?=
 =?utf-8?B?TWlqVE95RjhZWEgxY2lvL0dyUzA2RE1KWGVUSnBNRW5mbVorTHdGWHhmakI2?=
 =?utf-8?B?aHJ1Qk5sNEYxUEVBYy9vSjdxWWROYVBVeStnVTJWVXRBOEloRjAwNVdVSncz?=
 =?utf-8?B?NkVvdHVBbS8rZlVPb2c3YmoyRkh5OFExZWV1Z2IySHpiQVRPZFVnNDQ3bS92?=
 =?utf-8?B?RG9zS1JnTHRKcXFYVVVldXM0QzAxS0g0WVlYZ3RKWktuREZrMkx4UFIwRzhl?=
 =?utf-8?B?UUt5Qkp1Z1R1Mm8xa1hmQzg5a2xDL3VaRzg5Q2s4WnlEcjBGZ1dhbFlBb2Ex?=
 =?utf-8?B?S3BOaHorcnpUOXl2VzRBSW1YZGZ1Z2VCZ3FiblNta0Y5WTZsVHBBZCtRWUJT?=
 =?utf-8?B?UnZCTGdKaDlkdEw3ZzNJNGZ6YVdoZ1JFQ2theTVadVR3WWx1aCswd0tsS1dS?=
 =?utf-8?B?ZFFNNURWL09FWStkbFRVUEtMWDVvY1YvbHZoNU14QzVxYlFXdlp4ZWN5YVg0?=
 =?utf-8?B?Qm5aVFVqenVYa1ZqbnUrQTNRVldXSUFpYktnNnFIaHY3VmZoQlNVNnpPZnZT?=
 =?utf-8?B?WjlKQmVhMWxhVFZZWGp2S1pXbzB2U3NnNlJ0MHVXZVBpWVdwUFBDakhuQzU4?=
 =?utf-8?B?VjdTZXNKTUsyeW1PU09jaGVOZUN0akNubldKN2daczVOS2RCQkRQWmpWbXVV?=
 =?utf-8?B?Q0lxWUlod2gzeHR1akcwU1lVRmE1SE4yVXVNUGllK2t0QWpxbEVFajBhUkhW?=
 =?utf-8?B?OEtWTFdDTkI2am1SMEtkTnU4dkNRSmFGaDkrZmI1SUg1NlNSU292TmZoZ2lF?=
 =?utf-8?B?eTB1T3BWc3g4UmJydFYzK1hiMkUxTS9oS2c0TlhuNGQ4TFVabWdhUkxmam9i?=
 =?utf-8?Q?gayzJ4N8SEAoJfpk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aae96905-ef73-44b4-3953-08da17b9a849
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 10:38:58.7356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2v6kPdXCoFuy11APzc4hNbXkFTRR8olMKLs2tJY07Fixh7tyBq5dj2uqqyEMpI++yVcX5PKlOC8zAuFL5yKgRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6868
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 10:13:41AM +0200, Jan Beulich wrote:
> On 23.03.2022 09:54, Roger Pau Monné wrote:
> > Hello,
> > 
> > I was looking at implementing ACPI Cx and Px state uploading from
> > FreeBSD dom0, as my main test box is considerably slower without Xen
> > knowing about the Px states.  That has raised a couple of questions.
> > 
> > 1. How to figure out what features to report available by OSPM when
> > calling the _PDC (or _OSC) ACPI method.  I'm confused by the usage of
> > this from Linux: it seems to be used to detect mwait support in
> > xen_check_mwait but not when calling _PDC (ie: in
> > acpi_processor_set_pdc).  I'm also not sure what the hypercall expects
> > the caller to provide.  Should buf[2] be set to all the possible
> > features supported by the OS and Xen will trim those as required?
> 
> I'm afraid upstream Linux doesn't quite use this as originally
> intended. Consulting my most recent (but meanwhile quite old) forward
> port tree of XenoLinux that I still have readily available, I find in
> drivers/acpi/processor_pdc.c:
> 
> static acpi_status
> acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc_in)
> {
> 	acpi_status status = AE_OK;
> 
> #ifndef CONFIG_XEN
> 	if (boot_option_idle_override == IDLE_NOMWAIT) {
> 		/*
> 		 * If mwait is disabled for CPU C-states, the C2C3_FFH access
> 		 * mode will be disabled in the parameter of _PDC object.
> 		 * Of course C1_FFH access mode will also be disabled.
> 		 */
> #else
> 	{
> 		struct xen_platform_op op;
> #endif
> 		union acpi_object *obj;
> 		u32 *buffer = NULL;
> 
> 		obj = pdc_in->pointer;
> 		buffer = (u32 *)(obj->buffer.pointer);
> #ifndef CONFIG_XEN
> 		buffer[2] &= ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
> #else
> 		op.cmd = XENPF_set_processor_pminfo;
> 		op.u.set_pminfo.id = -1;
> 		op.u.set_pminfo.type = XEN_PM_PDC;
> 		set_xen_guest_handle(op.u.set_pminfo.u.pdc, buffer);
> 		VOID(HYPERVISOR_platform_op(&op));
> #endif
> 	}
> 	status = acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
> 
> 	if (ACPI_FAILURE(status))
> 		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
> 		    "Could not evaluate _PDC, using legacy perf. control.\n"));
> 
> 	return status;
> }
> 
> (This is a 4.4-based tree, for reference.)
> 
> IOW the buffer is passed to Xen for massaging before invoking _PDC.

Indeed.  I'm however confused by what should be pre-filled into the
buffer by the OS.  _PDC is about the processor driver power management
support, and none of this power management is done by the OS (I don't
plan to let FreeBSD do CPU power management when running as hardware
domain), so IMO passing an empty buffer and letting Xen fill it is the
correct thing to do, at least for the use-case in FreeBSD.

> > 2. When uploading Px states, what's the meaning of the shared_type
> > field in xen_processor_performance?  I've looked at the usage of the
> > field by Xen, and first of all it seems to be a layering violation
> > because the values set in the field (CPUFREQ_SHARED_TYPE_*) are not
> > exposed as part of the public interface.  This all works for Linux
> > because the same values are used by Xen and the Linux kernel.
> 
> Well, yes - that's the way code was written back at the time when
> cpufreq support was introduced. It should rather have been
> DOMAIN_COORD_TYPE_* to be used in the interface, which Linux
> translates to CPUFREQ_SHARED_TYPE_*.

I will send a patch to add those to the public headers.

> > Secondly, this is not part of the data fetched from ACPI AFAICT, so
> > I'm unsure how the value should be calculated.  I also wonder whether
> > this couldn't be done by Xen itself from the uploaded Px data (but
> > without knowing exactly how the value should be calculated it's hard
> > to tell).
> 
> As per above - while it's not fetched from ACPI directly, there
> looks to be a direct translation from what ACPI provides (see
> acpi_processor_preregister_performance()).

Yes, the translation from DOMAIN_COORD_TYPE_ to CPUFREQ_SHARED_TYPE_
is not a problem.

My concern is that there's some logic in Linux to assert the
correctness of the provided data in ACPI, checking the match of the
domain and the coordination type between all the processor objects as
part of setting the field.

I see that Xen also does some checks on the uploaded data in
cpufreq_add_cpu, so I wonder if I can get away with just setting the
shared_type field based on the coord_type of the current processor
object, without having to cross check it's coherent with the values on
other processors.

Thanks, Roger.

