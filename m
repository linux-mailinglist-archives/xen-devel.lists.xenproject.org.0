Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68984FD302
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 10:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303505.517784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neBuc-0001NM-Dg; Tue, 12 Apr 2022 08:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303505.517784; Tue, 12 Apr 2022 08:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neBuc-0001LV-9K; Tue, 12 Apr 2022 08:30:10 +0000
Received: by outflank-mailman (input) for mailman id 303505;
 Tue, 12 Apr 2022 08:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neBub-0001KL-2a
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 08:30:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bffc1c67-ba3a-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 10:30:05 +0200 (CEST)
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
X-Inumbo-ID: bffc1c67-ba3a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649752205;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=arp2Tlo/m+L53NGaLVXRpbp4QHzFp41ENqIQ7B2ih6w=;
  b=Z96/DnsbCmgUtaEpGwSdGRWeMpKXrvWHLg8w7C5cCwabeQb0pNA85ZRO
   5zVyrxbg70R4jpUSp63M3zTGy/hvlUHlaBjasuxdj2nNKkdQ1H31Me5kh
   sS+2OfNRkpgSGd+8Gfm4l9T9oZdChMRlqkddjJer1++XWaNlY5exlT8yD
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68059461
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7Xni0KwJK7l7KvUb1e16t+cbxirEfRIJ4+MujC+fZmUNrF6WrkVUx
 mIWX2mGbquJNmHyLop0adu/oB4G7ZbTyNFnQQU5qSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02ILhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl8qevEQMAAb/2v6cmdzN/CnhwGLZb9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JAWQKeCO
 ZNxhTxHbE6cOhkSBUguS5c0m8WwgmTjSRljkQfAzUYwyzeKl1EguFT3C/LWd8KLQ4NJn0+ej
 mPA42n9RBodMbS30TOY9lq8i+mJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvRhj9BuQRUVx
 GWu3OjNLxt26bOwUm+So+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpwivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyq2sbhm4XKlznXlrAAx8FeBvajt3Nr02wMHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX2PPAvMtLhUplwkMAM8OgJsNiOMbKihbArKme6ENxGPxbMjwgBbmBx+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbfelE2Rzx7U6a5LHFIU9UNopm5X9zgp
 xmVckRZ1ED+lTvALwCLYWpkc7ThQdB0qndTAMDmFQ3AN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:6nWvxKDekWLXfuDlHeg1sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkj+Ka+Adww4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJJGdZc8qPSMex7wqDL3QSuvyAfcZek600ykke+C3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68059461"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuZ538R4dI25jfi/9Z0dyD9iUiNDX6swru4oqa2Wqxb4g8I30z/xCCt8B8pKI1d7LKxOVw0lrllx6NdHoC2w6ITvNscUml+YR55HZhMDKizYpSS2RJFuy9rLWXBM/46EqWVlRwjyHo49sUYmzc5D5BJHReJJmKsywXWhPipFF7Fj1C1Cy63tNwfeTN9xMRc053F92cmHewNiUoQo7YcM0b5YsSJvxSQC7u+532rrou1LSG+Qu3dTp8bsbx8PvBhL0rNSzW4kSWvIQ7+pyeg7XccEqRnIBDm6qv5utLllQ/9ULBZ01ecafyvw1D/lqdZaTnJmzVFAW4oQUXW9+0fxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVW7ZGom+EaatdGl5qs+wFIX/34LEudnS43g77e4Wu0=;
 b=FuaqbIHM+IL68wFW9TP+DmP+XwCDQ0Jexavf/1wO2wAiaqM8R0kNn95/CXDvA6B5xBqf+ZjWgjU26doE8UEGwQpLVMVq5hEKdunhs23Dkfo2urxJZ028ObcOmYGm455IiF+hJvpAyWFLLTsxTTCB7uoVe/OF7zMrqQOhjWxtL19wjikNPW1w7T1HDQoUgD7Sx/MZGCg/8+QZTzbX+V91KyLufuiz/Qsr9Ky4XmUdSZEpN3gskoCkcFEfkK+20MCZPBqIxXckxcyQ+0h6Rmb2Qnq3+jECd30E7/k5WY2DREJXb1QscF+4Yvs66U8tZ5F0Lc6IOgiGMKOXEiidJWpuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVW7ZGom+EaatdGl5qs+wFIX/34LEudnS43g77e4Wu0=;
 b=VhRVXV1JcwIRFl+ZvYzuOiIZxKfnorCkm8zASU93iB/Ff5RRIVVlJi9UyXfdhZ6DQvexOpalK104uDdLbXZ8vEuEwco1xdAB5bPtze52gsGDfeRtP1obmN4fqj9NFCQg//+YRRJNrBkMsjROV3lo+4tHNRmX6WPWbvEscEX/3mY=
Date: Tue, 12 Apr 2022 10:29:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 3/8] VT-d: plug memory leaks in iommu_alloc()
Message-ID: <YlU4f8W1a/fBz1e2@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <10f43cc4-7a09-9f4f-0a6b-fd7ffd88310d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10f43cc4-7a09-9f4f-0a6b-fd7ffd88310d@suse.com>
X-ClientProxiedBy: LO2P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1b1feb5-bd5e-47b0-30dd-08da1c5e9fa4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3718:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR03MB3718154F41FE4141B909E29C8FED9@BYAPR03MB3718.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qfq0ZT5ZNZKRXTWLzT6h5g6y5rB822hlpwJ0PUmJP1kEhvVq/zK+Lj/tahoOPWjK37EYuhM07fC89jxN1gP1sGJWHFfGAxRwvi78I5KzmDLa/nZ8TRt7LSUsTMxlxdR9HVAoRUMsPxYBG4bf7CKUfpdvChrwjgSti+s15Ngynm8IYIxxZHq6isROAabSW0Vt9UmBALDvpI9VK88eaxD3AsIW1P7/0tkn+SIIGXDadvKnT6m9qe7Jv2SONk72UZ2SrGpUwjAruWEdbUsNjC3eg9fu1ioHxj4wyTf3MqOH9x76mHOj5HIwHrQAYhddCyTSyKVs1bIruCD/TZZTtwCC+K6IqwXhKNowPYgRSfvhsmctYKt7mri4V58Jf9F1VkFac8DSwi2p68xIyG0Qdj4bgGY+JUsoudKe63yq2JHD51EjjP9vVMCBE3IizRuYocZA39G/7gZps23XwCpDyn259zLApiScMFhQ8j/KR10Aer/qOvLIT1m5xDWZTOU4RyafCN/bNylOeY6spVVhx42EYyiRAJNYbL5lPxG1A3Jv26TVG8BNM/hmERmspBvHQa7DvF9N/Z0Lv/2OoOPmM12Qt8dFVwhpzSgBdShu0XQEZRE+hPDeNqKUG2e+uB3OQ6czwnoZuyvcD/j+PwRLP21mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(83380400001)(66476007)(8676002)(4326008)(66556008)(508600001)(86362001)(26005)(6512007)(9686003)(66946007)(2906002)(186003)(6666004)(8936002)(6506007)(4744005)(54906003)(6916009)(5660300002)(38100700002)(85182001)(316002)(33716001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGkxY3g0THpEdmNFY1FycUVLTU93OVVmMVhydDFXcER4RWFBZ2ZqOElzR3c3?=
 =?utf-8?B?ZmJVYUcxWWJ6Y3h0N1lUSzVhY29JaFRIR0hvbmUzRlBYbitUcjZpdXhYRXJk?=
 =?utf-8?B?QXFQd0RnWjZ2T2dkN29uSWRXM2NIUHQrcGRUUTdyZG5lTFI0VGttSExwcFAy?=
 =?utf-8?B?OEFZeEZ6dXJIaCtybUlWa2E1dDNPd2N3SlR3c3dJNzBzdnBZZnZMZHVyRDY4?=
 =?utf-8?B?V3JEZUhEL3ZPWlRqaEdsY1JLcTlIdVAzMWcya09BdDc3ODZMVjZkYzJxRDBl?=
 =?utf-8?B?VGgxQkZ6WVNFYzRJYnJBMVVFbmVVbm1vZWZhWlEzSnRmQk03RWRNNTVZL2xa?=
 =?utf-8?B?ajlVbmFrYVVnVERrRE5iMG0yZGRLQndKaCtpRVVnUE1OUDZKMEp5N1crUkJn?=
 =?utf-8?B?OTBrQUZpckIyUXhQbEhIbVVKcjVzdUJUdGVBNENyeFgvc2tuNVVJbkNwQWs1?=
 =?utf-8?B?T1FTMExSSXZkS1phN1NjWk0vNHRKRU9iQjhENFZ6M01lRGY0U2V0WmhVZjdX?=
 =?utf-8?B?U1VVWjBPRWhNak9FQVNBaTRGa2M2ZmVvaERpdWVQWnRtRzFLbkhONUNGSWZa?=
 =?utf-8?B?aDdMcHcrUEczaVI2WmVTYUllcFloWWhCVlUweUNqYzN5djNYZEpzdG9rc2Fu?=
 =?utf-8?B?cTlveW11dGptVWxrbDNCWUptbkgrNGwydTIydHExYXRuMnI2WitTZGhOdkdh?=
 =?utf-8?B?a2l5MjArajdHeFlVdmJpQjNkYkJmMXNON2g4NGZRSWg5bVBEUkwxWVE3WFh3?=
 =?utf-8?B?RnV5TWNmMFVBOUVkaFZWNUxHMDFwRHQxOTA4VkR6UWRZNVl0bUxLUFFBZkhn?=
 =?utf-8?B?RGRhbVZyanFzNTJzYmRSaEg5dXJibXUwV1UvR0hjVXEydjA1SjFuUHdUZFhH?=
 =?utf-8?B?UHd6WDIrZHRBZERUVmJRakR4UXUvekVnWEovUytySFhqOGZKbHBLRGc3N3VF?=
 =?utf-8?B?ZHY2UGdNZWJoWG9GU2JEUTJ1RG5sMWQ2MjhTZXcxa3AyZ0VHTHJWTzg4aGRG?=
 =?utf-8?B?cWo4czFjZUFlQTBoOGQxbkpCbmxreFBLMStXTEZCVnNNSkU2ZFhpV1QxYXFk?=
 =?utf-8?B?aHdlTXNqcXpkb3Y4SXRyNW92S0FraGtxb013K2xYNEYycEFrelovc205ZnRR?=
 =?utf-8?B?VVVoWW5pcW5jUGp1WGdTYitpQmRxOERLaUV1RWh2ckhMWmJSU0lqWm52MzFP?=
 =?utf-8?B?QnpHMzJLVkZWS3pUckVlWVN6a1dlSVo4Z0xPVGhzNVloN25JejdKZFJLVk5r?=
 =?utf-8?B?ZFhYTWgrVW9QMWlXSTZpakZyaDVIVnhMNTVGMGl5dWV6RmkwUmhHcTBZRUY1?=
 =?utf-8?B?R3paMEd3M1BRMitIR0xiYnJTdWRiVjBBOVpsUHh0U2UvaWx5c0JFeER4UHpW?=
 =?utf-8?B?a05tbFNBMWlKVDZZSGx6RjRML25xdEpuRElaVzRyZGlFRTZaNzlxRXg0MENI?=
 =?utf-8?B?T1IwcjFsWFV1dklKZjZRcEtKRFdtVXl6TktlY0hEUitWY2ZMN3Foa01aUWVx?=
 =?utf-8?B?aWh1YUdNZGNEejZ2SkgzNnlaOFZvbGtYRWllVjJCOENXVVBGZFRNVDlIRGc3?=
 =?utf-8?B?dHZHZFMxTDZESTMrS0Y5SU9aZ2lGRHB5bzBaRG40NmRIMHdsUENsejN6Q1Iw?=
 =?utf-8?B?cUJLb1lCbW02bVZnZHU2SEtFUVVGeVBSZjczam5UVDB1TGhFVVFycTEyWGZ1?=
 =?utf-8?B?SWg4SStNVlNmNzVSRlVZcVRSY0dQVWtQYWN6VDJEUnJPWDFwU2RqOGoxWTFr?=
 =?utf-8?B?NHZxaUhuWksxaXJzbEVDRmVOK2dsNktiVElxa05GVHo1NE14c1ZwdHdOZWNq?=
 =?utf-8?B?ZWE5V1NTSTlXb3JhN2J4elVETkpDUVdZRzNGY0J0RGNQRXZHVng0aHU3eVRr?=
 =?utf-8?B?U3g4cHg2R0pRQlJqNW9ONDM0dGFRdWZtZXZnajJDNTlxQjc1YmNGUVVkOG4r?=
 =?utf-8?B?M0xDR3FLa2R1RXFOSE91SU11SkJZOHdPZnFERm5QOEFQQmlMOW5uc1h4N0M2?=
 =?utf-8?B?eEhmYlUwNEh2M29jQUM1dDljNit2QzhUSlhNSmMwZUxaTEpYaFZCbG1aTGtl?=
 =?utf-8?B?Tm1pWnd6dmtTQmU0RmtqaWp2eTExK0tFWmRTRmxDSjl5V2xqdkIwRFIvMVZW?=
 =?utf-8?B?Y1M0RnloTzRQbFMrU2NxTVNKKzFMQ2x1NWVjK29paVNiNE82SEF5QkJBL1dt?=
 =?utf-8?B?YjlLTnlpcWsyZitIaEF3eWpwUEJ2SHV0b2dQb1RrcFVXYmhaOW1zMkxQRzZl?=
 =?utf-8?B?VHJHdFBnV05mY0xoOWlxRWttRXMyUU5aMjUwMmtKNWRkbTJMVUQ2Z040NExr?=
 =?utf-8?B?eVJ3MkJlQkowZTY2SVAvb2M3MFNVTGNBL2RtN0pjOGVCUnp3djg1ZFpwRm9Q?=
 =?utf-8?Q?WZa8KxvZHF5a7Xlk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b1feb5-bd5e-47b0-30dd-08da1c5e9fa4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 08:29:55.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gZjfUvrTO8U0wB7Brnl2SNjKj/hW9KDOGj2sXEZiR3Dh16+iQvGd5g8M7nzSJOdQEGzNhHwbSy4M6xVVYVNpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3718
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:36:43AM +0200, Jan Beulich wrote:
> While 97af062b89d5 ("IOMMU/x86: maintain a per-device pseudo domain ID")
> took care of not making things worse, plugging pre-existing leaks wasn't
> the purpose of that change; they're not security relevant after all.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

