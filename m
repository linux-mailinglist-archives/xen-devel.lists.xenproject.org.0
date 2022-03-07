Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F64CFD50
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:46:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285872.485145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBoq-0002yg-Ca; Mon, 07 Mar 2022 11:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285872.485145; Mon, 07 Mar 2022 11:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBoq-0002wt-8m; Mon, 07 Mar 2022 11:46:28 +0000
Received: by outflank-mailman (input) for mailman id 285872;
 Mon, 07 Mar 2022 11:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRBoo-0002wn-S5
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:46:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36725d44-9e0c-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 12:46:25 +0100 (CET)
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
X-Inumbo-ID: 36725d44-9e0c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646653585;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=v4zFag5yglm9rUEffzub4zUGwu5mVdz7ZYushMGUVXM=;
  b=WJJ/GIqIiAug4Q/Obqa2tzXogEQqSr45fUxIy0taN6fZMIx1hrFMi+YZ
   QSs2X0RgLYj5HEamUVKklVQlIXRQwySLl7pR+VwdRdZrOQFdkf6CHVA4p
   UHae5P8TeKEP9tWVI3230D6w8IM48G+znhT31xyLlUuAiE75yflez156J
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65077368
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Y62HF6wk3dxujKDSEVR6t+cYxirEfRIJ4+MujC+fZmUNrF6WrkUGy
 GRKW2jXbv2LNGKhL99waIrk9R9Uv5WGz4dlHAFqrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npli7ybTDcHFLf3hMtHdRQbSiZPEvxv0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0WQqmFO
 ZpxhTxHTxr5aiF2CF4sBrVkl9z5hnPufTNzkQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntTz/cJIfEvu/7PECqFSVynYeAVsNSValqP+wlkmWQNtZN
 0US/CM2rLM7sk23JvH/Vhu0um+ZvTYTXtNRF6sx7wTl90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt+3JLjlfnpePcm6yrJGZ7mq1CAdEBEZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQevBCxWtamS0bbtT834JrWjFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztVZl7k/C/ToS1Cpg4i+aihbArKGe6ENxGPxbMjwgBbmB2+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbYels2QDx6UqSJqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA9370s5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:CVNZNq0GiK1nHxYVlIid4AqjBVxyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YdT0EcMqyAMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQkTuRYTzra3GeKjM2YqbQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65077368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuSOcGbWAXx6w7NYrClwxogv5QX4IMSy9jIcTyJdfjdOg7J35AR34TwXxOpst1JGmX5pBbbV8siPVG6Ul3vlE9/ntNHEXLOaKJRPvzvbYM/8xsV0qFNpIOV/+ZiS8Z6c8BK/Tua/9eepCETsAaSQ6qLe6u77BLcf5iEgqxu5xqM5tthZd9hI0lPQaUIwsLVjfuEpgo0PiGDm8NZv8IZG75cZ3fka4G0XCzqnkiQGbjP5xkXBGmvMWamZfqK4tEEAOxbjBL46VMSHO3ViRPvNcDf6FsfHz5AOQxGedLHpAoN3lQco7s8p5MUUlZB6Tg/E666Adl5olfuQQ6EKwTx2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhnXEgI3LXEG4DO6l2VCUSOoxWuihfY5Ax29qTSzuAA=;
 b=keDPhwwKFzgvkRJEeXewd+SoMV3IRhMWxEKaI06kZHBTK5q4mBQBToAtaEy4OcxASPjMciwjxr3lWqiDEPBFZuceLhgKF0D6Unp4m3cMFz1qdeQ0XxISs9eNMM6lM0YEl+LKPZ5hXJK6wAsTvNYvH49ayhTVapRNz57sh990y459R5cCCBjqnzrV7P8SMphLdbctsOKoWVHJaSyl4p+T1oF2a1st5F2mq3N5VUqvEJxBHR3QQrvjBhZsdVKkWfGuc5L8/829yPWuKXLbbMS5KdPARp/VWDjM9UzKs8/0NQbJy1jfmslNFGUAtgv1r1VZqAKXWGQl3cQq684+yGLwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhnXEgI3LXEG4DO6l2VCUSOoxWuihfY5Ax29qTSzuAA=;
 b=JYrPXO+gRc93KfrKWTQODdl52BmYma6qB23s+LNi7tKSPeXALOObXwzMhj3Lt/ds0nTsMknF8YCFmkHFissE2rA3P8zQrvk06BVpCNeQC1zdBI/YSGrQEFvG7cJ0+L+6psu1yTMI4x51JiTaqHtkn8qMm9lCnQJ0gc9KxLVvH5U=
Date: Mon, 7 Mar 2022 12:46:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
CC: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: Network driver domain broken
Message-ID: <YiXwhUnZL8bcJvH2@Air-de-Roger>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
X-ClientProxiedBy: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f31e55a8-7235-4ac0-3ef7-08da0030173b
X-MS-TrafficTypeDiagnostic: MWHPR03MB3311:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB33114FADCC3F8C41B9D4A44D8F089@MWHPR03MB3311.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +yLObZd9j6ZfFG7XdqiZ+S2OX9JGOWyka8RVdnp22LmesSrtzNiEdMh58esR/MIm5OdGnvGLpYpjdMpopasPq/CETQzCdz2JaED5PFppmA7XQzFh+dO5bHdsbf+CmViCW/VmpPZ/I3e71/UN2PPj3WZm+/MCnOBAI3WR8tQnIi55KoNCksoUi8+QJnw0BK/XJSGncFaVNG0zKlMQSkccPaehLuv3eeKeDRPXam5D8NB5fjg0VgVdO1NsvwWrLRTuVNOzNXT4xgRP3Xdp6l6oQNN4ePmbtLhfhytca1nbhXpXzTcoTNkbKrNJ7RSXvO+Vzc/DoiaambuGDLJ2rAt5fh/DSYrcM6fuaoC9hJNaRTTwxzNIOrsoHxOXSXJUGXqeRVITWNNuYSxTo0nNklfMJB1lGGgIl8zGXnP1tl8fNZCcBLIh5y3Y1TEpZtrpI5VNmZ5r0yA+NZNo8QyL8CFNYcHzIPX9GdiMY8XN68HvmBTB5ejmdDTQ9rFDaudbgb6w1qfIWywxtFsBbtWzr1TZ+IxJUHPIiIhhBY2tW5q5Oj7X/JKJFfk1UsKjfBjRmQKDzEvfDuIIEi6jqFlDUAbrLbLQGSbh2VhWl/ok6uXtnImQI1rh6HC9EAiN4PaZMtHe8qYaDhgSd3JUtFn4ICWDdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(82960400001)(107886003)(6512007)(2906002)(26005)(5660300002)(8676002)(4326008)(6916009)(66476007)(66556008)(86362001)(83380400001)(66946007)(186003)(6506007)(9686003)(6666004)(8936002)(316002)(54906003)(6486002)(508600001)(85182001)(33716001)(3480700007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VIdTMwMnZ3M3hVUCtTUGlsRm9FSEhQaTh2NEVGZ0pBaWZtTTlpa1lsT2M3?=
 =?utf-8?B?M2QyeUllMUdsOHZUeHRqNDRZMVdkV0hmSWYrMEp4NkhXTDhDOTMzcXBLVVNr?=
 =?utf-8?B?ME40OVNIVVl2NmtvU2pCMDAyaC9VL0N4YUhpeG0zS1ZwRUh2WU04OWIyWnFS?=
 =?utf-8?B?NTFrN0dKYUpNdlFqN2U3MUNFdmtZdnRzdlZSdjNzSzN3ckNoWk0zSHpSdnRa?=
 =?utf-8?B?cmdlYmZheE40cGxLc1JMcXZFU3kvd0xhMG8zaDdOQ2FMZlNCbFZySlE0eGdq?=
 =?utf-8?B?VEpFRFk1djM4VmFzeWJ2K0FJYWNTV0xBZXZaTDZZMklRVWR3dkpNRDhSTWdu?=
 =?utf-8?B?djVoVkxzeFNaVlVnd3Q4ZzRyNGhKNUJLWGJvSHZtZ1RBVDVUREdFR25tdWYz?=
 =?utf-8?B?emlieExqc09HSjR6MXpKYjlpWjhUeXowVXRPa0hQenM1MEMvMlZCWkdZRWhV?=
 =?utf-8?B?VUVLRXJ2akZINEVhOEJsZFo0dzBINEdUeGJaVEk3ZkpQb1RRcWZBQUg3ZHMx?=
 =?utf-8?B?dHdMc1Y0TjUwMnF2ZnBrdmxhOVd6WHBjTHhEakdZQVl6Y1UrZmpiU211Z1BT?=
 =?utf-8?B?eFlMZHJKUkRkYmNFbzBPNVR4VDFCQzJvaUtaczF6eHlsRFI5Um5mcGtaQ3V4?=
 =?utf-8?B?WURlcytUMUVqdVhZYWZXUXp1a0dQZnNhUWhpVWJ4ZUdoWnA2SUdiSThKMEJQ?=
 =?utf-8?B?QnZYd2ZJSDVrMlBqV0o2WU1OZnoxazdta2Vpd3dWdG1mcUtjNkRzWXN3bGFL?=
 =?utf-8?B?dlZ4VFF0MzZKLzVHK3dLQW1pQVRta091VURpalJIWkVDMG1Kbi80ZDRMSVNq?=
 =?utf-8?B?NTFISE05TVhOTFpmZzV5bFU4elRHdU1MSkEzOVVSa1VuVmxmYk5FQ0wzZElE?=
 =?utf-8?B?R1dqLzluQitPelVLWFQ2djJsa1BtYzlhVzhzd2lIUGJDMmluSG8wNVFnNU40?=
 =?utf-8?B?eEtXSzIwY0NXb1pvM2NiU1dYM2ZNMzFKbWwxTGEyWWQzdGI3UFZqR3FTajR6?=
 =?utf-8?B?cWpwd2h5bDQ4dWxXcHdhaXk1WFpOdThCSVRacWlUb1FlTHAxWEJuTUNNTG1D?=
 =?utf-8?B?M1FIY0ZCeWVtN1U5V3lRWkhzdlJjYjhNMzhaQWkyMmdEZmZmbTVQOWFoMUYz?=
 =?utf-8?B?S0FmYktDZG84MFN1MG00UEZRSXlUcHlrSnFvdGx0RTg2azVITWdBVVExMUQv?=
 =?utf-8?B?bUQyNUl0L2F0Y2pTckl0UXIwclN4bjNreVhIM0kzNEtYbEtESW5XMG1TSlFs?=
 =?utf-8?B?QVNIcVpDN0dRK1QwTFlmWUNMaVpNY3FrRXl3bkc0Y0h5dXBsS3dvVFpoWGpo?=
 =?utf-8?B?WE9yVGlpSXdseHR6UUtnVVFCL2JZRHFIUTlZQWRPTjNUTk5ha0FHV2dsdXVB?=
 =?utf-8?B?RWFxTzNGMjcyNEc1MlRiTGlFdnp0aHVxLzV5OTJpU2R3MzczNmoxd3BoNGZD?=
 =?utf-8?B?eW1ZdWRCb1JVQVpyL0RyZEJ2WkVrZnpHL1Zoam1YMXlid3IwUVdYV0JuR01r?=
 =?utf-8?B?QWdPd3UrVmJ6WmpjYUdvdmxveCtQelpBck9RdHNWb2dNa25KcmNiWWN3b29O?=
 =?utf-8?B?a3pVYVFlK0hFekI3c1U1YmxPbEpKNGhMUVIrVTYyRHg4U0w2WXFsRGJ0TkVq?=
 =?utf-8?B?NllZNktDN3RKc0VkOTd1eFVGTTRGUEpCWGtNbjA4cklLN3JIa1NLWExzTGJ6?=
 =?utf-8?B?d1dhSllhbFREVUIzSWFXL2w4MFVZMU1tV1RKL3hOSHkrOTJZbHhuTXcyaUpx?=
 =?utf-8?B?MEh6ZktHdHNKT016L0U3Q2V1Mm1PYy9xUTl4UmdZNXZHMGNOYk5ia0pNVjR5?=
 =?utf-8?B?eHV1eGpyNk5mRFB2a0ErR0FaT0ZjNTdHMGFLUlZvY05PYS8vdmMyUjBzSEVn?=
 =?utf-8?B?U3Y2cHZYZzRZV3J6Q282a04xaU54Z2pyczRZWHBkdHJmZmV0aVlYSTV6Y3NP?=
 =?utf-8?B?RXNiMUZlY00yaDBZejk0K1NvZjFPSjFlcWJHV3Q1UnJDa1BHUnkwMHZ2cG9h?=
 =?utf-8?B?MXlFcFNTTGJtK1RocTJQVkJTQ0JyNmErL0hCblpNaGVqdllXSjZuN29MSGd6?=
 =?utf-8?B?ODhJTTh5dFVTUTN1UzlVQzhKTzhiUFpoTnFzZzF3dkFKVDNKYTVzaGdYeTJW?=
 =?utf-8?B?NjRsS2pzVlFwa2RsaVpVRDN6VDRab3FlWWlMeFBJUk9uTUEvN0xHTGtObW4z?=
 =?utf-8?Q?LP+yMGNUysmwdIvVhYCNCZo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f31e55a8-7235-4ac0-3ef7-08da0030173b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 11:46:17.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJ6EH4cpYjl6zSlzJsky3U5HnzaN/rnesACfAFXsFtZAK4Oiu308m9PaDBtjBMW7v1rROMUkplVqApYyRs624w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3311
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
> /local/domain/2 = ""   (n0,r2)
> /local/domain/2/vm = "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
> /local/domain/2/name = "guest1"   (n0,r2)
> /local/domain/2/cpu = ""   (n0,r2)
> /local/domain/2/cpu/0 = ""   (n0,r2)
> /local/domain/2/cpu/0/availability = "online"   (n0,r2)
> /local/domain/2/cpu/1 = ""   (n0,r2)
> /local/domain/2/cpu/1/availability = "online"   (n0,r2)
> /local/domain/2/memory = ""   (n0,r2)
> /local/domain/2/memory/static-max = "1048576"   (n0,r2)
> /local/domain/2/memory/target = "1048577"   (n0,r2)
> /local/domain/2/memory/videoram = "-1"   (n0,r2)
> /local/domain/2/device = ""   (n0,r2)
> /local/domain/2/device/suspend = ""   (n0,r2)
> /local/domain/2/device/suspend/event-channel = ""   (n2)
> /local/domain/2/device/vif = ""   (n0,r2)
> /local/domain/2/device/vif/0 = ""   (n2,r1)
> /local/domain/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0"
> (n2,r1)
> /local/domain/2/device/vif/0/backend-id = "1"   (n2,r1)
> /local/domain/2/device/vif/0/state = "6"   (n2,r1)
> /local/domain/2/device/vif/0/handle = "0"   (n2,r1)
> /local/domain/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n2,r1)
> /local/domain/2/device/vif/0/xdp-headroom = "0"   (n2,r1)
> /local/domain/2/control = ""   (n0,r2)
> /local/domain/2/control/shutdown = ""   (n2)
> /local/domain/2/control/feature-poweroff = "1"   (n2)
> /local/domain/2/control/feature-reboot = "1"   (n2)
> /local/domain/2/control/feature-suspend = ""   (n2)
> /local/domain/2/control/sysrq = ""   (n2)
> /local/domain/2/control/platform-feature-multiprocessor-suspend = "1"
> (n0,r2)
> /local/domain/2/control/platform-feature-xs_reset_watches = "1"   (n0,r2)
> /local/domain/2/data = ""   (n2)
> /local/domain/2/drivers = ""   (n2)
> /local/domain/2/feature = ""   (n2)
> /local/domain/2/attr = ""   (n2)
> /local/domain/2/error = ""   (n2)
> /local/domain/2/error/device = ""   (n2)
> /local/domain/2/error/device/vif = ""   (n2)
> /local/domain/2/error/device/vif/0 = ""   (n2)
> /local/domain/2/error/device/vif/0/error = "1 allocating event channel"
> (n2)

That's the real error. Your guest netfront fails to allocate the event
channel. Do you get any messages in the guest dmesg after trying to
attach the network interface?

Does the same happen if you don't use a driver domain and run the
backend in dom0?

Regards, Roger.

