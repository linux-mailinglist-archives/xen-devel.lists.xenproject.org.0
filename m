Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E794D32B3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 17:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287982.488355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRypa-0007hi-Pi; Wed, 09 Mar 2022 16:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287982.488355; Wed, 09 Mar 2022 16:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRypa-0007fi-MW; Wed, 09 Mar 2022 16:06:30 +0000
Received: by outflank-mailman (input) for mailman id 287982;
 Wed, 09 Mar 2022 16:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRypZ-0007fc-7K
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 16:06:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de7db5db-9fc2-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 17:06:26 +0100 (CET)
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
X-Inumbo-ID: de7db5db-9fc2-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646841986;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uw07yybbbAtrr5oZbng5bpTm/rxiKu7lQ+qu6HIzv9U=;
  b=DVDyllCbwmX6/6ptZBkV5juLRytCc69MTsiItaDbqdqgEqRry28LLC8V
   ZR2ziS9PkOJCKgOC43v1RFxVC8o7Um8svtx+2sulsSNEjWpuddg8lJSgP
   szcdngktL0I/OpXghbEdujEDYt6jtRg30hvDd0BN65/CLUzqNwdXQyOA0
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65841244
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:w8jSz6oCBU+JKF6QAhkwb3XljaxeBmLlZRIvgKrLsJaIsI4StFCzt
 garIBmFafuKNzOkLt10PoTi9EwCsZ6BnNRrTlE4pSgwQSMQ+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 YKq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBAfX0vvsZQgBkDiBaNI5a6OLNDkmmvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdJNWM1MEiojxtnFkk0IpJih8KUg17hbSdU8lWEvPQw7D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfNgCf6VYQ6BLC+sPlwjzW73mUODDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQcvc8rQXoR1
 1mGn/vgHzkpu7qQIVqC8p+EoDX0PjIaRUcoaDUYVwID75/GqZsqkxPUZt95Fei+ididJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjqeRdigq4hTOYn+kygpaeJ74baOZ8FeOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVfvEMJGPxf4M4XRfK4Ey/9X1
 XCzK5rEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbgTQMrppsP/Y/m05F
 uqz0ePQm32zt8WkPkHqHXM7dwhWfRDX+7itwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwUE2WZoWtBNcehxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JZL+i+JK46sM6S8m4=
IronPort-HdrOrdr: A9a23:DSaZba1WtcSeJ4MEAjda0AqjBVZyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdLz2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P70rhJJGdZQ8qPSMexnwqDL3QSuvyAfcZek600ykke+C3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65841244"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReAgBXYCHyPlClTqYsj7gdKreG6n+A8xbNeFIoeVlDcQZxGYR2EO+Xlsi8pU0hDuso8blHSNTT+DjzVSVPGyDQNMqaxySvsjOepK3LqOYyep+XwMyXeh2DIKzviaqw2sjC+RCqLRNegdcdwCbYXvUDR+aNRlovM+imi7XRY/WE1mPvHsc1bHUU29GWqVfdLFRq48Xe+kKFfxCwlkN1V0xnf28Rtf0E4byP/KN5K9wYZ/Q2Z8KwJEntKrTcmxTtEmYJ74Ap6sSvq0EEWoOuNYP8EfxN1Z252Yz7FMkzRQGXmd110BklSx5ftieC2RIl5JEbPZAuw3yzVlB/J7wQGy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3drGM7bML45U7g01fjTBjU3bjsi+aTm4m4efEhJI9U=;
 b=UXDiIKi89ZtE22u/KST5HnHHvWYaWMcpChpTrwrQpgS93rlioJ3oOWkErEwFj6h6RUu4CjjPrBOAT8PN+N9zJhg6JAlrXGmu8ET4pP0ZzdyIkZW7zZk9H3rWT52CZBnnM328EGW5k7FabCIGcuz30k3MjS7+ZNx06SFnJ/ttvzmPbGSr4Q/dSObQ3eMnHlUpQ2G04sI0ijJWHjjegC4zQOUaInkgjmZQ/dJVZZsSYk4CP9HcZ1cL6TtWb2fZct79aVpJDmdAXjKVAf1KQ0v9gUb4TIG113kYrrlADjTOj5U2sfN1qdhnfPE3eEFcqCo/bfwvJofWlqNZuvgLJXL/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3drGM7bML45U7g01fjTBjU3bjsi+aTm4m4efEhJI9U=;
 b=oL9lilEUo2r4H1SCtW9Xzke+SDI+PMG4ZCwR8D5xrHqy68rERRVyswLDZuEyjqaV+1jjAWK7kvKWqiMCU3XkNVvIhaP6th22G2XjZfnonUJYuRUMF7iWN9CDxTls/hucYsl4Pg3A0rDFmpnjMH/ah+aJivCcvcFVYleG6luw1/8=
Date: Wed, 9 Mar 2022 17:06:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Message-ID: <YijQc9DejYAo3EcS@Air-de-Roger>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
 <35ad9273-956b-86d6-55a3-c737575a7880@suse.com>
 <515CDCB8-43D2-4D08-9195-D058E641E1BF@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <515CDCB8-43D2-4D08-9195-D058E641E1BF@arm.com>
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e65d6b81-4ccc-4841-1fd6-08da01e6be27
X-MS-TrafficTypeDiagnostic: BN3PR03MB2290:EE_
X-Microsoft-Antispam-PRVS: <BN3PR03MB2290DAB9B7457BE03B065BE48F0A9@BN3PR03MB2290.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6+TguxNx5Bqz1onGPVTzi2mykWB5xQWn+bbTfjBNp0Ps9FXTawKbY8VJGFRmUdzXBWEcQVLAeJz9ztFB7SUs8lNG3BVIxBy6siCwfi+OL8ZCZe/9lZp5TFQg8lC4eVeySZthueTbPNilNr8XqWT7qefzzq+8orZ7tLhQTSz2GzIa9ztt4IsmNyGCWfpg4ID3NSc8MCfT3kbTzZgPGA71XEJNSWfh+YUHplCt0lAc3iIdlQZmTXKPlbuzWRHu2ybric6owfRW8u/FB8n/KqWkIUZPSaIBpvkoLlfTXnmTaD6pl4XPIImAWr2Stsw91z/ORF0DV08cNa4/0C+cG/Eu4ym4MJkWBVUoSXj4zTK09CIeKmhGg0f33cWG27bc8ayERWy1kK1kx2Fz3XtoCovxtW/+CQ+uQYOnMfUhUtRL0TmfedzFqYXwIW8YoYyn6AM7+h1X5+8xjuKM0yDupcRwav2JCKsMp+lH0fHuZ5ZYP09iv4YPHaSRrwzJmBjetm3hGRanjaitW7BCa/NiwiircOf7LXkc6ac9N62vPcKLQ3aYwHp04m63l91q3DAFdRta6hPKCrHSOEHi8fTPNb6ryZARh9uG0Iu74aoWKy7rSgSUQd3diNJEmPUhiFY0GwD0YxxBuKh1sX83bzOHXPzpCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(66946007)(4326008)(8676002)(6666004)(66556008)(66476007)(9686003)(6506007)(6512007)(33716001)(53546011)(6486002)(82960400001)(38100700002)(6916009)(85182001)(83380400001)(2906002)(86362001)(316002)(186003)(26005)(8936002)(54906003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2MwNTFuK1RHVkhnR1dzMWxMU3g3L0RXdmNHV3lKQzZJM01yMThucEkyZWVE?=
 =?utf-8?B?bkw5Smx3Tm10S0lqaVQvRDhsODBBS0IyanBVZFU4OTIvSnZzVDhNVFB4Sjdx?=
 =?utf-8?B?UFlYc295NVhBQjVxYjFpK1pJTDdWK1ZrWmlIRngvRGx0bmkwWUFJa3RnaFhU?=
 =?utf-8?B?VHBBZUZzZDBaZEp5eW13ZEQ0OTJkWExyVDh2NDZ3RlpqeGdHY0l2Z0QxMkk5?=
 =?utf-8?B?YmRjYThhbGE2YUtsODJIcksrdWRVQWJCRjhFeTdVdUwrMXAxQ3p1WWhKejZp?=
 =?utf-8?B?V08zWFFPWFRkVUlOK09xaytnZ2NrV3M3R1RSNHhaa2t5OTA4d1FMZjdvenJC?=
 =?utf-8?B?QjFpdUtnd3hheU52NVcrd3hnbDJabWNMZlRnVVY0ejJiTitCTXk1L3laU05Q?=
 =?utf-8?B?THNUWTVzTFJyZHNpK1pveWlzL3NST3FWeTRuY2lIV2psaGFzRjRSdnltY2Er?=
 =?utf-8?B?Z2FDc1FQNUhCUnc1NVo5TFh0aFNnV2YvOFJhMEdOKy9lWjJOWEtoOC8rTVJO?=
 =?utf-8?B?aDB0ekJyanZzMXR0Z0RhOVVIcUdVRk0vUS9aNTFmNmpDeEljTUV3TGlJSmJ1?=
 =?utf-8?B?dGdjT3Jqa1hibmJNRXZ5dnptL0h1dnRFQ1ZPZDNBYnhLSE5LV1NGSmpyQXBm?=
 =?utf-8?B?MTM0VnVpWWwyREg1bHdwTEhwT1NveTBhQ0hFenUxdnhtMGVxN2hhNnZvSkpW?=
 =?utf-8?B?Y3p3RkRaSXdNRFFoMDRoUkFqaVBJVXFkbE9zejFjbFFPKzdSYVhuYlFaMEpG?=
 =?utf-8?B?dy90eWJvZ0dtR3p6MUZod2htRmpBQlBGN1FFNzM4bXREMzVqTXZWbFVKWGVm?=
 =?utf-8?B?TW5sVGlLN3YxeTFFMHpIOUs1ajN2bFI1cnZqOUtqN1p2VXI2c0NrNTY0NnR5?=
 =?utf-8?B?MGprWjFDa3pjdGQ2elQ2bERsZjBtYldmR3BQTWMrMUNudFBoRXQydjRDbEo3?=
 =?utf-8?B?V3daVDJTd2VVSU8wTXgrbkZxNEgybnpPUTlHUkZDTlA3OWwvTGs3ZGJBai8w?=
 =?utf-8?B?cHhqWjlLQ00reGZPaGhSWDdZQ0wvV1RtZTVjZzhUZUdCT005Y282M29rR2Vo?=
 =?utf-8?B?NzlQOE9pZHB3R3Q5S2Z1OVNPYjNOTFZrK0hBT0dXVmVVZjhlQlhiTXVSS3or?=
 =?utf-8?B?aVFaNmUvVnM4RHZEcnM5ZG9lWnVDYm4wSkJDWmNKUU5ReDJ4OVkyOVgvZDN2?=
 =?utf-8?B?dmVWSXczR2xnRjdEbHRoNXRpUjFVQmc2ZFhKcDFwY2hPTml3U0ZtT2kxZGJ4?=
 =?utf-8?B?eGVOWXE1cmdzQkc0M3JoY29zTDg5NjNObDdQMm13V3h5NHM0RXl5amM5VG1Z?=
 =?utf-8?B?QkN0RmdBankvWTM5ZFVNOWd1QmZEM0JzUFNaRzBpTTlLejVYMTdjZGxKM2Fj?=
 =?utf-8?B?aUM3dWhvbWk2MzdiZTVxbXN5WVBVT1hMQ0lLYU8rcGhJQm5lOVl0elhUS2Va?=
 =?utf-8?B?SjVvOXMzSi9WSFJSSVZoVmE0ZWpjS1dWRDA5QTJwcUFTcmZESUNTV2J4YnNC?=
 =?utf-8?B?c3lNWWUxRzFQV1p0c0w1Rk1XNzh0TllVZHQ3WDk0SUM1ODEvWHE4SWtEc0ZK?=
 =?utf-8?B?RjIwLzAwRmtrWXhZN3U4ZU1LelhLcURRclE0b1YzamNSS2V0LzNrc2Y1WTkr?=
 =?utf-8?B?MFpKWkloQk53dGM5b3FLeGU3SmMzQkZybWQzVHlNUFliMzExK1MzVyt6aHhN?=
 =?utf-8?B?aE1ueUxYODY5NUNPbWpyZkU3M2llMUR2WlgxSjMzQzVTZWE2QzdYTXVadUM5?=
 =?utf-8?B?K3VWYnB5T0RobjdYUDQweGtDSW5OczFEYWFTV1hEN3JKUGx4Ym1Ub1pXTFha?=
 =?utf-8?B?MEZNekppZG5pbVJhY1ROUHBDK1kvMWUvcEgzSk9uM3JmTnovaTNkVDNML0gy?=
 =?utf-8?B?K2U4S0dCdzc3U0ZiNERHTjdRVjZIY2h4NmNBa001WXhYTVpLTU8xZ1phUFBi?=
 =?utf-8?B?KzV6N2JpYnVXYVdJTGZnSXY5NHR3SnhobUY3WjRzSEtWNUVwdXBaaS9JNTNB?=
 =?utf-8?B?UHpMZ1hkak1nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e65d6b81-4ccc-4841-1fd6-08da01e6be27
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:06:17.2884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCJNPER56SHFSLMCPoSySDaX52xxrMwHnyuGnR6t+aQq+132FJ+Bc4bwkoDdqybhv3lpq8Lr2MV8NN1wtQKEaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2290
X-OriginatorOrg: citrix.com

On Wed, Mar 09, 2022 at 03:50:12PM +0000, Rahul Singh wrote:
> Hi Jan,
> 
> > On 9 Mar 2022, at 10:17 am, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 09.03.2022 11:08, Rahul Singh wrote:
> >> Hi Jan,
> >> 
> >>> On 4 Mar 2022, at 7:23 am, Jan Beulich <jbeulich@suse.com> wrote:
> >>> 
> >>> On 03.03.2022 17:31, Rahul Singh wrote:
> >>>>> On 1 Mar 2022, at 1:55 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> On 01.03.2022 14:34, Rahul Singh wrote:
> >>>>>>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>> On 15.02.2022 16:25, Rahul Singh wrote:
> >>>>>>>> --- a/xen/arch/x86/hvm/vmsi.c
> >>>>>>>> +++ b/xen/arch/x86/hvm/vmsi.c
> >>>>>>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
> >>>>>>>> 
> >>>>>>>>  return 0;
> >>>>>>>> }
> >>>>>>>> +
> >>>>>>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>>>>>>> +{
> >>>>>>>> +    struct domain *d = pdev->domain;
> >>>>>>>> +    unsigned int i;
> >>>>>>>> +
> >>>>>>>> +    if ( !pdev->vpci->msix )
> >>>>>>>> +        return 0;
> >>>>>>>> +
> >>>>>>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
> >>>>>>>> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
> >>>>>>>> +    {
> >>>>>>>> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> >>>>>>>> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> >>>>>>>> +                                     vmsix_table_size(pdev->vpci, i) - 1);
> >>>>>>>> +
> >>>>>>>> +        for ( ; start <= end; start++ )
> >>>>>>>> +        {
> >>>>>>>> +            p2m_type_t t;
> >>>>>>>> +            mfn_t mfn = get_gfn_query(d, start, &t);
> >>>>>>>> +
> >>>>>>>> +            switch ( t )
> >>>>>>>> +            {
> >>>>>>>> +            case p2m_mmio_dm:
> >>>>>>>> +            case p2m_invalid:
> >>>>>>>> +                break;
> >>>>>>>> +            case p2m_mmio_direct:
> >>>>>>>> +                if ( mfn_x(mfn) == start )
> >>>>>>>> +                {
> >>>>>>>> +                    clear_identity_p2m_entry(d, start);
> >>>>>>>> +                    break;
> >>>>>>>> +                }
> >>>>>>>> +                /* fallthrough. */
> >>>>>>>> +            default:
> >>>>>>>> +                put_gfn(d, start);
> >>>>>>>> +                gprintk(XENLOG_WARNING,
> >>>>>>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
> >>>>>>>> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> >>>>>>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
> >>>>>>>> +                return -EEXIST;
> >>>>>>>> +            }
> >>>>>>>> +            put_gfn(d, start);
> >>>>>>>> +        }
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>> +    return 0;
> >>>>>>>> +}
> >>>>>>> 
> >>>>>>> ... nothing in this function looks to be x86-specific, except maybe
> >>>>>>> functions like clear_identity_p2m_entry() may not currently be available
> >>>>>>> on Arm. But this doesn't make the code x86-specific.
> >>>>>> 
> >>>>>> I will maybe be wrong but what I understand from the code is that for x86 
> >>>>>> if there is no p2m entries setup for the region, accesses to them will be trapped 
> >>>>>> into the hypervisor and can be handled by specific MMIO handler.
> >>>>>> 
> >>>>>> But for ARM when we are registering the MMIO handler we have to provide 
> >>>>>> the GPA also for the MMIO handler. 
> >>>>> 
> >>>>> Question is: Is this just an effect resulting from different implementation,
> >>>>> or an inherent requirement? In the former case, harmonizing things may be an
> >>>>> alternative option.
> >>>> 
> >>>> This is an inherent requirement to provide a GPA when registering the MMIO handler.
> >>> 
> >>> So you first say yes to my "inherent" question, but then ...
> >>> 
> >>>> For x86 msix mmio handlers is registered in init_msix(..) function as there is no requirement
> >>>> on x86 to provide GPA when registering the handler. Later point of time when BARs are configured
> >>>> and memory decoding bit is enabled vpci_make_msix_hole() will clear the identity mapping for msix
> >>>> base table address so that access to msix tables will be trapped.
> >>>> 
> >>>> On ARM we need to provide GPA to register the mmio handler and MSIX table base
> >>>> address is not valid when init_msix() is called as BAR will be configured later point in time.
> >>>> Therefore on ARM mmio handler will be registered in function vpci_make_msix_hole() when
> >>>> memory decoding bit is enabled.
> >>> 
> >>> ... you explain it's an implementation detail. I'm inclined to
> >>> suggest that x86 also pass the GPA where possible. Handler lookup
> >>> really would benefit from not needing to iterate over all registered
> >>> handlers, until one claims the access. The optimization part of this
> >>> of course doesn't need to be done right here, but harmonizing
> >>> register_mmio_handler() between both architectures would seem to be
> >>> a reasonable prereq step.
> >> 
> >> I agree with you that if we modify the register_mmio_handler() for x86 to pass GPA
> >> we can have the common code for x86 and ARM and also we can optimize the MMIO
> >> trap handling for x86.
> >> 
> >> What I understand from the code is that modifying the register_mmio_handler() for
> >> x86 to pass GPA requires a lot of effort and testing.
> >> 
> >> Unfortunately, I have another high priority task that I have to complete I don’t have time
> >> to optimise the register_mmio_handler() for x86 at this time.
> > 
> > Actually making use of the parameter is nothing I would expect you to
> > do. But is just adding the extra parameter similarly out of scope for
> > you?
> > 
> 
> If I understand correctly you are asking to make register_mmio_handler() declaration
> same for x86 and ARM. You are not asking to modify the x86 MMIO handler logic to
> use GPA to find the handler?
> 
> As Roger also mentioned that vpci_make_msix_hole() is required only for x86 to clear
> the identity mapping. If we make the vpci_make_msix_hole() arch-specific there is no
> need to modify the parameter for register_mmio_handler(), as for x86 and ARM
> register_mmio_handler() will be called in different places.
> 
> For x86 register_mmio_handler() will be called in init_msix() whereas for ARM
> register_mmio_handler() will be called  in vpci_make_msix_hole(). In this case we
> have to move the call to register_mmio_handler() also to arch-specific files. If we move
> the register_mmio_handler()  to arch specific file there is no need to make the
> function common.

So then for Arm you will need something akin to
unregister_mmio_handler so the handler can be removed when memory
decoding is disabled?

Or else you would keep adding new handlers every time the guest
enables memory decoding for the device without having removed the
stale ones?

Thanks, Roger.

