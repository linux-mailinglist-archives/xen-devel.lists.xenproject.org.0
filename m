Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4A49DC83
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261299.452259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD07l-0007xO-Tx; Thu, 27 Jan 2022 08:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261299.452259; Thu, 27 Jan 2022 08:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD07l-0007ua-Qu; Thu, 27 Jan 2022 08:27:21 +0000
Received: by outflank-mailman (input) for mailman id 261299;
 Thu, 27 Jan 2022 08:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wmt=SL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nD07k-0007uU-Bj
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:27:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efa2bee0-7f4a-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:27:18 +0100 (CET)
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
X-Inumbo-ID: efa2bee0-7f4a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643272038;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0aRo1HYytPhs9Tr1gK8GGp0P04cJ7QALtKlb118Ap8g=;
  b=d9hlq1wKlkpQXANfUPhwiBQVbrOwkTXcAbZOYyU8xaEOTfWUxam+82a1
   ywnCcs7ADxhI9SeMlXKVJDS5ERApr95T23qs7OSTp656Y7XHfu0URB6vz
   mjcpTvrMiJOpSoX6d4/gtPX6dfJBiJsRb4WhLbEL+5NAGasaJ+9hFOPfY
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sJ64WfSDeMdiONTXucYd3uTx5dZ2R0smuh8B25H2gPfgwnJOOsUaKVlIUdnwhhJKX3d3GFbFjd
 L58Z6EmBnPo3hi9ZEODD+dzp9LwpHkci5Orp7kpZ3QUJtry0iUpyqwaVU6APCvwm1qN+fpj/wz
 jCsiD2XyJu25SFtVOMXYQyO4Jru6xQmLWE9lFW/vCooIx1KnWNU/Vp7YXT3BysTO8Y91eKiuxK
 ts+9NUP4jZDZgrYClQ7tTDVIjCWXA445xg554DzwT7bWFPZuGOIh4NRpbLglvihgNWmwROcafL
 nd/0Qu5MURQbp0rQBQEQ0nLp
X-SBRS: 5.2
X-MesageID: 62790235
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ayFZzqACcAl7oRVW/2Plw5YqxClBgxIJ4kV8jS/XYbTApGxwhTNRz
 WtOWmCCaK6CMTH2fd5+PN7j8RwGvZDdn4IwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940007wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tymlgZcgx
 ctxqIXhcl5yL4Pdl9QkTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+VtIcCh2pYasZmEcfMd
 ssrODVWQC/fUwFmMFI8D8ogtbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSASN9JhE+eq
 iTD9n7gHxABHNWFzHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWQ9tCL
 2QE9yxoqrI9nGSwVcX0VRC8pH+CvzYfVsBWHul87xuCooLW6QuEAmkPThZadccr8sQxQFQC6
 FiNmN/4AC11h5ecQ3md67S8oCu7PG4eKmpqTS0ZSQoI5fHzrYd1iQjAJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2H4XzZxGOhuKTUV18Ov17GcHOq3jpmMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2MBjatSsIoHONiwM2ITRTNt4wKuBN0+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jeHEPybOF+pdbQrmggUFAEWs+lu9H
 zF3bJPi9vmieLemPnm/HXA7czjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9cNokihrc+Rp
 ivVchYBkDLX3CSbQS3XNCwLQO6xDP5X8CJqVQRxbA3A8yVyPu6SAFI3KsFfkU8PrrIzlJaZj
 pAtJq29Pxi4Ym2XomtGNcik8tUKmdbCrVvmAhdJqQMXJvZIbwfI5sXlbk3o8iwPBTCwrswwv
 /ur0QazfHbJb1sK4B/+ZK39wlWvk2Iane4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtH6tIuE7tiwa8kycHoortWklZtEHnRNgz5AbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVN8POqZ1PwSlj3D1tgPIR33tH1t4b6KcUROJB3Q2iZTG6R4bdE+y
 uA7tc9ItwHm0kg2MsyLhzx//niXKiBSSL0us5wXDdO5igcvzV0eM5XQBjWvvcOKYtRIdEIrP
 iWVlOzJgLEFnhjOdH86FH7s2+tBhMtR5EAWnQFaf1nZyMDYgvIX3QFK9WVlRwtY+RxLzuZvN
 zU5LEZyP6iPo29licUrs7pAwO2d6Ml1InDM9mY=
IronPort-HdrOrdr: A9a23:61QHFKPB7MMwI8BcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,320,1635220800"; 
   d="scan'208";a="62790235"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERcL5QE/G+340MEaLL5mLVpRP0zpc9ikW76FC/n4XIc/XMIA4+X9zUsOGkdgvilkjcsHhdtvXrK70tqsnd8cIEDfPi9bekbTxkKj174KVOWqNegVWW75ukWOL/b0eAW+c4YRafMe6jPagpz3NIZH0zuCsL9hWtTA6OkcRO0xvDRCGUQS64L7IW+ul6znRn7KNp5TSISGu3Q9BguI+m8Qdw1dL092rx0CHOw45RoCWlrkBhVAXIIzA3SeY9MYoH9zt94a7WchfHTioDxAJJrgR9Ml8rOWkH6N/CiynueAeES/1/YPTYWROuQBMZm5u6kRke+vQ46pR0gFbCiFF8NxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FokOvpbtqEKuo3CLY63io3uWo3Idy8l8lS9fNisrU0A=;
 b=cSZR2p4tPtKcrYg7AaKFmXFh07a2hd3qDofnybbL7W8TGIVWtzVE8ayNJeqY2rSXZsWZ6Mr7BmNhK2kAxI3ZAIzYT1QyJNhy2p7AUDw0YxcLhoO4vw9fP9tZSNElF7Wqbx8xt/6thPacfPM/q6SmwdZtYhadCSHqhdkYgxYkuVYYnhtuKy8+2oYklKAeK3rptAOCgLq/9qxUc4kQ99yo8gualht+Ke2rLw/c3LR2i52GONW0vWbTa/LFdjmWDnB8E6x0NJfntKjUhmIbTJH3cLOS/6KOmw2asnS4WnNBjgGystuM8kjuvRnFx5NjM9MAhqC18ePd7+9XIoiWwlU72A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FokOvpbtqEKuo3CLY63io3uWo3Idy8l8lS9fNisrU0A=;
 b=S+YkbPcVSXGlQy7JlsvUjzz8HzRlBIMMMzGvwjPx9OQqvm56bLXtfgicTp53QWXFuIu9ffxWatSNuBZvZviPMGhYOOBWHF8WpfcwdZlXJvkvnPO4NYgMdJLF44kWqqueb6+8e3vj2+14zVhZ7DKIw+UQi2vLcS1jdBZrIBLTPm0=
Date: Thu, 27 Jan 2022 09:27:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Message-ID: <YfJXXOzDuY8UX2Qv@Air-de-Roger>
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
 <YfFshcEanUtXUlK3@Air-de-Roger>
 <00d0be87-b5b2-b713-661b-eb07e5a5a53b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00d0be87-b5b2-b713-661b-eb07e5a5a53b@suse.com>
X-ClientProxiedBy: MR2P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d11da98b-0ff5-4208-f51b-08d9e16ed162
X-MS-TrafficTypeDiagnostic: MN2PR03MB5200:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB5200503318CE855418865BFC8F219@MN2PR03MB5200.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3m1GAyExGke0mNilYMhL17x3TXMS+69CCsyttSJYHH1dDRUSRM8qdG1RAM6iWvDCeAkAQoULXuvx6XXawrIHp93jr1kT3J5D78PbLa2Nw/F0LzFhwEp1HJr5hHNtu0qOD7LKi9kKitcOHNHme35CcqlLOhHU+opTGPNUG8QW/TdEgZ+v4jS5TgkOnUVJTGgO12qa0YD0rHxjMNmJW9uUlTBdpO6+qlXF0P5nr6sFEFCFOZkDv47mDUDJC7Ol99zddECHgV4FNSI3pF/WQQfQ6muhbzYv3YnWuaxOcEW1d6oqGPBvEi+AX4eyhd3XyiviCKZvYOiyF0H2WysWZq1dKJIsHPDr9gZZsHEdaR0g09S93qQFLhu9BOMJLuhMrf4vfTBfIWxRg0XJws2+gGlfIv3a3cmMQJVj1dvWAEeng0dm9EaZWSZuDgSu6NkXar3Bf3JQJX0cG8MJGc5iPx9hrJWQZ/IkuxSPzrEFjBm/DMr4At1xIEuGFsfLXBOHdtTjeqn2cVKNTh7JPngjdrro6QTGImPmrQ39CeoWw5fKJ/++5pGeYOnj2m83DjYZ/CU0xtvXVudyNiwHUzWbbeULnk6buw7WZLF3O8auCZNQgt/Cw46hdgmMilgJgQ4S/xf6K/MY6fPT5yIDAHit539EyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(2906002)(8936002)(8676002)(316002)(5660300002)(4326008)(9686003)(6486002)(6666004)(6506007)(6512007)(186003)(26005)(85182001)(6916009)(508600001)(54906003)(53546011)(33716001)(83380400001)(38100700002)(82960400001)(66946007)(66476007)(66556008)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0VOM0tEejRKQzdtTnlOVlRGNFlmMDBJcVVUd2liWTNGTGNyNGw2U043ZFZo?=
 =?utf-8?B?Z3RYWkZEWU92OFcvTHYzVXBkbmF1Yk9MTTRMZzVkRk9xZUVjQWMrNGtwc1Nl?=
 =?utf-8?B?b1JXTE94dWd5aEJDRjhmdXptdVdzZEE2cVVrazcrSUNaOVh2eUtkUUdBbEhP?=
 =?utf-8?B?UUFxMEcxRHNPQk8zeE5JZ25WUElEV0ROY2JJbTFCYjZxMjRjWDh4ZDFncmZI?=
 =?utf-8?B?cnMxeXY0V3RQS2Nxd1RrR3MyNDlpZWo5UDFUT2N3cUVBQnBWSUJJbkN3eFpN?=
 =?utf-8?B?OTUyWks4TGNxS21GN2tiZ1NicEdkK3FTbEEvTTF1ankwbUI4bkFKUzBCVmhB?=
 =?utf-8?B?K0JPWXI0cUo2b3dKZ3laM1l2WDJMYlB5cmdvOEEzMm9nbmpiaTE2MGVPbzlT?=
 =?utf-8?B?QyttYVdjd2RwejRnUXZvYWhlZml2STk2bGRrOWFYTmE2d2lKYW13Ym1CQ09T?=
 =?utf-8?B?ZVY3dS9xVDFTeWYwODVpaHU4N0crUVNCNHZ6WDZ4UmxRbmUya1laSlVtMUJh?=
 =?utf-8?B?QWVlYVJHNlZyc0FFNlE3OHNzMVRjMlQzK0ZJUU83dk5VdkdLTzYwVi8rQm5Y?=
 =?utf-8?B?eDRPdTliUHF2YVRjRU90Nko3QStnRTVDeUhQUHIxWnQ0TW1iYkI5d1g1TUVI?=
 =?utf-8?B?dC8rODdSU01rRHMxZkpNRzNhQ2g4TkZCYlFwUHYwME1wZ3VsNzdGMUN3emFU?=
 =?utf-8?B?RFdBdWlIVUFvRW5nbkZQY0xpUDJGa2czWmlLblNDRkJub3U1UnZpYjF3bmxn?=
 =?utf-8?B?MVZnWGsvMkM3Nkd4M2FjWEU2LzNBMkpva213Y1FDVUxqTlhMOHBvQUswZXMx?=
 =?utf-8?B?NkM2aCtOc3QxNGhrTGNDVU41MjJhSmNHcGc0K1B4bkJ1bGJFQUdoZDltdm0r?=
 =?utf-8?B?NmNqMEFyYm5VS2lvK0gySnlEL3diWjZmOEd6KzMvSTg1b2o2Wm5sM090VkNl?=
 =?utf-8?B?cUtLSXlHQS9tME05OHA0WktZS2dmbmhwYjdGSk9RZHRSclIyTkZ1SEJOTEdX?=
 =?utf-8?B?d25ic1pMang1OUlnUU9CUXliWXIyUXRxOGpUVzlseUMwK2RxL25UekU1QW8z?=
 =?utf-8?B?OGlRb2ovbGxkUDVlc3N1OExJZVk0UnkzZzFQOUVCRHhHWWRHVzAwR1hlRXlu?=
 =?utf-8?B?UmtubGRtRGlmaTFKZ0g4eFlBdFFkbWJUUHVxckhkMDlaTFB5cHhML2txL1ZM?=
 =?utf-8?B?ZzcwYm5hV2JudUduYjliT2tWbTVIRUxVMDdyQUdiazlJN0F6ZWpzNTdkUkRs?=
 =?utf-8?B?Q1lwL2h2aGRTYnBGYi8wK2JLNDhmK0w1ckt5cHRCZ1VKbDVzMUNvbmpVQVdV?=
 =?utf-8?B?blFGUXk0dHE2UWlSTDZPR3VNRDFxc29IeExxOGF1YUFqZ0YzbmZQM0ZpM0tK?=
 =?utf-8?B?d2E1cTV1TEZBemNnMUdNbVpMZEpZZ1dzRXFyWmowcno4WklleTBCUjMxWmdI?=
 =?utf-8?B?UnBJZXN5ZUo4MjJiWFNCL2VCU2MyOEVkejNyeVN1RjdyQnB4Wmwvck5ZYXdU?=
 =?utf-8?B?R3M2blRzb3pHNCtkaDF4NmMxcm90eWk4UnZYTEEwUHJsdFBtanhseUlFTFIx?=
 =?utf-8?B?eWYvRjQxemgramtrVXRRU0VoeWp3WDBORDloYVNpNjNaQ2ZIWm84a2tiajRK?=
 =?utf-8?B?OHEzdU9HNEd1RGgrSHlXTkhxbm5ZKzF2b20wYjJ2THFFN3JMNU9wTEhEZ1o2?=
 =?utf-8?B?bTBRMkY0N1pVMHhzaFlPazd2Q0NjaFpac3V6QjhkKzd2ZXZHdzVLZmMzSTJs?=
 =?utf-8?B?eXJEaWFIU3NGZTU1c09RUEZjVFlaQXhVYkVnYW9RZnFseUZjbi9IamowV2ZO?=
 =?utf-8?B?Z3ZyWW5OUmpjSUZMOEl0bGpEU0VtcUtNMHdRYTNvZUs4T0dEUTdCV2pJa1Fy?=
 =?utf-8?B?VS9FL3h0aTZlVFJkVk02YXRvWWJSeVNQUktMdFpsT1VyTmtjVG1HcndvSm0x?=
 =?utf-8?B?Y3lqY0Q1elRqMnN5YUZNQ3lGZEJvSW9teFF3WFV4aWJ6T0ppTGl0UEh4eno0?=
 =?utf-8?B?WDBxVTNUaU5IMUo0ZFAxVHBic0U1SjJXTnVSaFM5MThoTWw4SFJTeVhTNGZp?=
 =?utf-8?B?b3o1UUI1ZnJyMlZONlFWUlpkbUZmTityQ05GbjJEcnRHbDN5MTFWcFBDSzk1?=
 =?utf-8?B?N0dhY3M1cnlWamNIUGhDWDhaaEVIdSs0OTN2b3hHU1J2b1VtOWhPalhuSjhx?=
 =?utf-8?Q?+qWfn1feXHvpbbZ6tJNdQMc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d11da98b-0ff5-4208-f51b-08d9e16ed162
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:27:12.7412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzEbY9tgrk0DWnomUIjU8HUMDNHW6cN2hXJErX5GCPDGhqXfjxsAT0LuHwdB30nDCgUnnMflXTmRG300Ik/E5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5200
X-OriginatorOrg: citrix.com

On Wed, Jan 26, 2022 at 05:09:56PM +0100, Jan Beulich wrote:
> On 26.01.2022 16:45, Roger Pau Monné wrote:
> > On Wed, Jan 26, 2022 at 03:08:28PM +0100, Jan Beulich wrote:
> >> On 26.01.2022 13:26, Roger Pau Monne wrote:
> >>> +        if ( entry->type != E820_RAM && entry->type != E820_ACPI &&
> >>> +             entry->type != E820_NVS )
> >>> +            continue;
> >>
> >> I think UNUSABLE also needs checking for here. Even further, it might
> >> be best to reject any range overlapping an E820 entry, since colliding
> >> with a RESERVED one could mean an overlap with e.g. MMCFG space.
> > 
> > Hm, I've though about adding UNUSABLE and RESERVED (and should have
> > added a note about this), but that might be too restrictive.
> 
> Why (other than because of firmware bugs)?

Handling overlaps with those wasn't strictly needed to solve the issue
at hand, but I didn't take into account that an overlap with a MMCFG
region would be equally bad. I've extended the check to cover any
E820 entry.

> >>> +        if ( size && !is_iomem_range(addr, size) )
> >>> +        {
> >>> +            /*
> >>> +             * Return without enabling memory decoding if BAR overlaps with
> >>> +             * RAM region.
> >>> +             */
> >>> +            printk(XENLOG_WARNING
> >>> +                   "%pp: disabled: BAR%u [%" PRIx64 ", %" PRIx64
> >>> +                   ") overlaps with RAM\n",
> >>
> >> Mentioning "RAM" in comment and log message is potentially misleading
> >> when considering what other types get also checked (irrespective of my
> >> earlier comment). (Ftaod I don't mind the title using "RAM".)
> > 
> > Would the message below be better?
> > 
> > "%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlap detected\n"
> 
> This or maybe
> 
> "%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n"
> 
> in particular if, on x86, we'd be checking for any E820 entry type.

Done.

Thanks, Roger.

