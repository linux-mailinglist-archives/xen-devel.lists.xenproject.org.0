Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A1524F1E
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 16:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327701.550581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9MC-00087p-1i; Thu, 12 May 2022 13:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327701.550581; Thu, 12 May 2022 13:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9MB-000860-Tz; Thu, 12 May 2022 13:59:55 +0000
Received: by outflank-mailman (input) for mailman id 327701;
 Thu, 12 May 2022 13:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNjF=VU=citrix.com=prvs=124a73a71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1np9MA-00085h-FU
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 13:59:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f05b78-d1fb-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 15:59:41 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 May 2022 09:59:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4097.namprd03.prod.outlook.com (2603:10b6:208:60::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 13:59:46 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Thu, 12 May 2022
 13:59:46 +0000
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
X-Inumbo-ID: c3f05b78-d1fb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652363992;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o41mNaevaTxntnew+xI0OYxY9uRdpnNkt/vJLRIP5Q4=;
  b=IIVGXBJeQ0zHOUUuASYsMvmv13dxMZDoyuGw3bXV94F2AFqrhNw77iTN
   X8F2Le9+yJrZa/wOpZL5Tdl3xZ5+ZoJlgSg93x+xYOGQCQBGy19mbmZEV
   r89vWPey8Wtw79zwvqfyb/nR/XalHOYyR0CYFKG11kqi5xfF4yl/c9BVC
   8=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 71036781
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:r02z2ajBZdmSlP4wCsU95zd9X161YhEKZh0ujC45NGQN5FlHY01je
 htvXGCEOq7cYjPwfd5zbd7j/U1QvZDdzdNlTwZprSxkFC4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrX4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTsGAqzdoeQBaAF/Dn5SN7155L/VI3fq5KR/z2WeG5ft69NHKRhueKc+paNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuocehW9o7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wvN/vRoszG7IApZ3KrdKevvWYCzStR8l2S9h
 XOfz0brK0RPXDCY4X/fmp62vcfNlCX3QpMPF5W38/drhBuYwWl7IBgfT16yu/S6ok+4RdNEK
 kYQ9zYurK4970iiRJ/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScC0
 1aIm5bjA2NpubjMEXaFrO7M9XW1JDQfKnIEaWkcVwwZ7tL/oYY1yBXSUtJkF63zhdrwcd3t/
 w23QOEFr+17paY2O2+TpzgrXxrESkD1czMI
IronPort-HdrOrdr: A9a23:+IgSCK48nUbP7MzXRgPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,220,1647316800"; 
   d="scan'208";a="71036781"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wej1ryreZ6YrlH2+y+pjEcq5vhMETZo8BQ/YxJz3xPTMlpU/62GusYE5pNsMztUH+0IDV/m5nzVShgC/ClvRhkspoSyMe+Wn7Z+anZezPDZjzTPoHXXvMBKE4wkkECm5SpM+FxhsifRCnWiu7rBXatai2UMHMfm3gQkJ1Sh1xqGSgrqpuCYPdAQpiHVuCkS9l+PFAO2WVzsPKyxYKANA9+ITkM5XZSK88Wl39aEboxEKPj3brFEDryhJZkL0IyFNysu7NuB1pXvrv2AAAYv8SBUA9qJ7QirJjsE2oTHjBg7ZqYeIUXMlaMy2E0xLIXGtDWjzr/EVANe3M+yVCB3+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUVnq91lsYz9R+1UWwnN5ZQ+HeoMQMcVuT0iWoZwXNQ=;
 b=oV0YNhB8AOFT89Cc3TPwqXb+pFNEgt2kJTD2DSaMfnIC5nlO8HjSqL/V3Cd8W+WY4aJDw9yaKA9ZtO/4krvSOEE0WF+BS1jI8YB4+MMSJxyLV0EjSBvmqZhOf8uGlUaXImBfRCRdu8/vMcDKfVBPJHYc6Q7VLKq/LBOvK9gTs5YETW/OSeLEqZIDFEloWrCpuqyp4ujnDWAXx1aSdwjDNx/RYAm8AqBgguqGwjYpJg/cKm8jiaHhjViB/O7M5uCCBvf7V4tPo+f7q/HJ4SIO7RD6539dC41wO76baqxffUFlYRNr+/6bmbTGbjFqonie7/CYvvMLi/8cK9CGz1YY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUVnq91lsYz9R+1UWwnN5ZQ+HeoMQMcVuT0iWoZwXNQ=;
 b=QyxCeCThrkaMYuYumCgoTWKYepqrpDNxe6MO4sQ6pp6n5AayEG6pZfeVLutGqV5v4cjP0L1q6SQjOYSLRzO3xD1dDM3EheCu9i4mM5zI09/KrBPHBTyx6gKnsEoboEYn9NC2MTf5Cr92He67lA4i8bQL7DseZ2k/NJ7nR6Gg/wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 12 May 2022 15:59:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: xen-blkfront crash on xl block-detach of not fully attached
 device
Message-ID: <Yn0SzjiwMU32Xc0z@Air-de-Roger>
References: <YnwNjgtWtKaVLIuu@mail-itl>
 <CAKf6xpt8TeRYkbG3p=trqWjsw86sahYV_NKVPxergjsu7orocQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpt8TeRYkbG3p=trqWjsw86sahYV_NKVPxergjsu7orocQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e8045dd-e166-4f03-0a2e-08da341fac49
X-MS-TrafficTypeDiagnostic: BL0PR03MB4097:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB409719A04A3F9870D71DE7598FCB9@BL0PR03MB4097.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ISMlseaaoz8LkON1ePC7N+IA82Kz199JbwN2aVkBPAX9nTFiCtidWiz5w8s3oAuwC4JBMyMeBjYZ5Xe7TCvWRol5feLdqgjqtQto/y1JwERuih6v6g2ttQNbwSqzwsMZ9VUcF3fz+zn9cWCbrhsbwr+KNsuKnsmZp/5OpQdfmwHoQSlPZ/hsBpu171KE9hd2gZ5twInGwJUbs8QaESs5mX64Kw4VCsOFpPqNT1u339XKNKNcsk36HcJ+NTm/usTPHRS3lUZlFVl0ZjEH3Ksf4XmL4bNmKWrYwmnl3WNo4OpD6rRtHFnu/2zRmZ+iwHj8z2Ri2JiNALx1SsgjmGOrdDnhJIMiEfnImvnLhpvapabgxaEqBqljE9s1lLhlm+9mZVvUlTre1CYpoyj81kKApZ7tpTfjx0+wq0gnvlAX2KCF0avQoN/cBwIZur1dCZZt6HUQhCXcuqNaL6pv447cOCsGxvEBwhstWQZcAbjDSQVKjhTGsKtEZvk325XewDIsnh1cKds4ZrKoJ6tpGwVWqpCKkHTG5G2Oa//6cXcJWIRWPJ8o86IjMKYyJjqsYVbmKxJeBe2eGS2NPqUODCuksm0f07mEpFTHhD9J1nOfVMPK32vXZcxm93pFQb2YDUI/fhV40DDQQCH+Goox2uFpzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(6512007)(66946007)(85182001)(86362001)(33716001)(6486002)(508600001)(316002)(9686003)(66556008)(66476007)(8676002)(4326008)(53546011)(45080400002)(38100700002)(6506007)(82960400001)(83380400001)(5660300002)(8936002)(26005)(54906003)(66574015)(186003)(6916009)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3I2Vk0xWkVyYlU0czg1b1dsNytnck5pQUxRdy9mWjV2M1JTVWlhVEhaWi93?=
 =?utf-8?B?MzhiQ0dvZ0txWWpKalJVSEVNdSs4V0UrbTlsc0tvREVrT1NpZDVXVmlKYUVU?=
 =?utf-8?B?K2t3TERLTk5PWVo5QVNrREswbGYrWUpJNkJIQVpXNUpvUnVxbW9qdmVkbk4r?=
 =?utf-8?B?SVdJTWlUZSsxWUZia0VyTksxRkRQZWxobjFQWlJTenZVckMxWlB1Y09LazNt?=
 =?utf-8?B?OGs3VlJJeWVXa2hrMXFXUktab1ZGZ0xvN2hLSzJ2cXNwTWQrVWlla3RWRHdN?=
 =?utf-8?B?MngwOS9ENkltZGI0U2QyL05Rdi9tdktLODREaTcvYUpsQlg0eDN1ZmZ2aHZ0?=
 =?utf-8?B?dEtCOUc2VkZvMnVrSWY4YXJJVWVSYlM3aVdRekVmMzJrR0RZbzBFVElTNXFp?=
 =?utf-8?B?dDQrNHNVUjNhZXNSSnMvQmdFcHdJQ2VmWWRNcXVIVmNHMzFuZHJxMUF4N1ZW?=
 =?utf-8?B?VVZ0bS9hMEFSQmVkS1F3UDFPQlBhYUh1QTBuOTRWWnhJanVENlhQRlJSTndj?=
 =?utf-8?B?WG5wYW1xSm8yTVR5Vk01VDViS2s2WkFwaFpxREdGWmdRQTF3RVQ1REwyOFFn?=
 =?utf-8?B?TXpJMTlvclphdlJSNEpsS0ZRYU90RjhZQlNaVUx0QjRtbGZQU0wyLzJXTmxW?=
 =?utf-8?B?ZGhHSGZrNGVub2hZaGxsbnJlME5ydFM2ZDFiakhiNmswZCtuV2ZmQkE0QUpV?=
 =?utf-8?B?Ynh1UFJwbndNSlI4Tlk5aVB3MXFSSldVYlVEV3N4dEUweUszdDFPRDk2ZCtJ?=
 =?utf-8?B?K0FqeVZUdTU0eWxPT0gxNklxTU0wOXdHdW1SY253TUxPdmY3dmxPN0k0ZWRa?=
 =?utf-8?B?eXgxWnk4V3JmYXpxUGJINjJBQ0dqTnVPcmlPbXVBaTE2TXg2bXBUaTlSTjFt?=
 =?utf-8?B?Tk0xeVZIV29vVGkweUdubjNkNUorZlhVbjZNNFltdEwxdGNzUjczRUxOdGtE?=
 =?utf-8?B?NjVTMEg1bFpZQzVZRGJ4Y0lwbDE5eU9QaVJ4bkN0Njd5b0JBQ3R6RWtXNWgr?=
 =?utf-8?B?ZmRLbmI1dVM5TERaL29Yb0xzQ3lGRXVVYzQ3OGl0dzE1VTVmaXc3K0VLaDNl?=
 =?utf-8?B?ODdud1JvTFR5cFBoNmdiZlRTSmVPY2xIMElYeGpRQXRLU3NLM1ZZTVdvbGhL?=
 =?utf-8?B?TlI2L3pYN3I1eVNwQ0F4Tm55MndVekZXTXhsaUZTa3d3dmhRWHYxdW1icE1R?=
 =?utf-8?B?eWJPanQ2WHBKbHJXZGR5STdlcE10b1BtWlFFUWRlamU2eVRGbHljMTM4dCtk?=
 =?utf-8?B?UTBSNFJZSHM2SFJhNXlYcVNWZGVZUGhpS0NaL1RwdG5xTkNNeEdlemJFcUtF?=
 =?utf-8?B?ejhBV2g2OG8yS2g3ZXBBams3dmc4TkhXcWk2ZG9pTEdQNno1cDdHUk9pc0Z2?=
 =?utf-8?B?T3Zpb2R1Y0RUenkxM3A3UU9sZDkxeW1vRDBxUC9rYjRRazVlM085TjFzVzM5?=
 =?utf-8?B?TURPc2t2elNXcGZIY2k0TmRqWFlNNjNqZDNRZSs0Y2RBYk9lRmlBNGZYWnE3?=
 =?utf-8?B?Q2dlRE9Ld0cxOGZMNHdlL2JCZ05Oa0s4bmN6VVdpd05wd01pNU1vY1V3VmhG?=
 =?utf-8?B?TE9uRko3SWc1RkcvdVJhckJteDZBZTRPaXhTZ3FINjBqU1loYUlQaW9ORWdE?=
 =?utf-8?B?QzNkNE9KRlU1TkVCd25PS1p0WmxLRmd6OFpjYlJmWjUvNHlYTCtFcWR0ZlRM?=
 =?utf-8?B?bzAzMG9IYXAvOHUwN1ZSYUh0UWRCK0dsRE5wVktGK0YxRXZ6ejVBa2xHUysr?=
 =?utf-8?B?SVVtdHV0U0tTdTBoYStnNzZ6VkdtbDdnQ0xLOXpDdFJDUzVOODNqak9SaGU5?=
 =?utf-8?B?QWorRnZDL2lqN3h3WWkyNkFZNDBIeFhnK1NWaHRlVGR5WHE4OEE1c3ZMbUFs?=
 =?utf-8?B?OVIwSER3SURqei9ORVRhWDV5SW9WMS9NSStZY1E0SW4vaGdMV1Q0MkNDS2RD?=
 =?utf-8?B?K3pVdVdNUkZIL0FXb1ppUTRnTHJIbmRZc3lwKzFRaTdZWithYXp4d1IrWDBn?=
 =?utf-8?B?ZEVRMkg5UDB2a1kva01SMVJGZi84WGdPSlpvbmU0YWp2ZG4zTERJaGZMNHp4?=
 =?utf-8?B?akl0aTI4clArVTNEemRNYlB5cFZXQnUySTFoMCtmb0FTMTk2SWlHYmpmNzFE?=
 =?utf-8?B?U1Z5NGxuaFhwVTBnTExpTjk0YytId2JJTWd2WG1TMXgyRmlGK1hrNWQ4Q3Vt?=
 =?utf-8?B?S016YlFjcnBUbzh1WEpqMmRucTRhWXZYcXBhMTYyT0JXa2EwZjdzZXEyK3FI?=
 =?utf-8?B?YjZhR3V2M0xhTTRJWTFDbEdTU1VYS0tDQWlWeUpPa204WThtUnlhNGJja0wr?=
 =?utf-8?B?SlVmQ2FrKzhLL2txNWNGajRxeDhuTTJzVlNGdElPOU5iU2xvN1VkSHcrQ1J6?=
 =?utf-8?Q?PGz1WMHk5WtXysPg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8045dd-e166-4f03-0a2e-08da341fac49
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 13:59:46.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNqAJ7UErMS6oVsg7CfmXdmSrN/mPEBgoZ3kwj5KdMk7vAQPZst1GA3H8skOoy9ko06fnFRBhdqB3d6wFf8Y/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4097

On Thu, May 12, 2022 at 08:47:01AM -0400, Jason Andryuk wrote:
> On Wed, May 11, 2022 at 3:25 PM Marek Marczykowski-Górecki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > Hi,
> >
> > The reproducer is trivial:
> >
> > [user@dom0 ~]$ sudo xl block-attach work backend=sys-usb vdev=xvdi target=/dev/sdz
> > [user@dom0 ~]$ xl block-list work
> > Vdev  BE  handle state evt-ch ring-ref BE-path
> > 51712 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51712
> > 51728 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51728
> > 51744 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51744
> > 51760 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51760
> > 51840 3   241    3     -1     -1       /local/domain/3/backend/vbd/241/51840
> >                  ^ note state, the /dev/sdz doesn't exist in the backend
> >
> > [user@dom0 ~]$ sudo xl block-detach work xvdi
> > [user@dom0 ~]$ xl block-list work
> > Vdev  BE  handle state evt-ch ring-ref BE-path
> > work is an invalid domain identifier
> >
> > And its console has:
> >
> > BUG: kernel NULL pointer dereference, address: 0000000000000050
> > #PF: supervisor read access in kernel mode
> > #PF: error_code(0x0000) - not-present page
> > PGD 80000000edebb067 P4D 80000000edebb067 PUD edec2067 PMD 0
> > Oops: 0000 [#1] PREEMPT SMP PTI
> > CPU: 1 PID: 52 Comm: xenwatch Not tainted 5.16.18-2.43.fc32.qubes.x86_64 #1
> > RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
> > Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
> > RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
> > RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
> > RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
> > RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
> > R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
> > R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
> > FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
> > Call Trace:
> >  <TASK>
> >  blkback_changed+0x95/0x137 [xen_blkfront]
> >  ? read_reply+0x160/0x160
> >  xenwatch_thread+0xc0/0x1a0
> >  ? do_wait_intr_irq+0xa0/0xa0
> >  kthread+0x16b/0x190
> >  ? set_kthread_struct+0x40/0x40
> >  ret_from_fork+0x22/0x30
> >  </TASK>
> > Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack nft_counter nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nf_tables nfnetlink intel_rapl_msr intel_rapl_common crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel xen_netfront pcspkr xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn ipmi_devintf ipmi_msghandler fuse bpf_preload ip_tables overlay xen_blkfront
> > CR2: 0000000000000050
> > ---[ end trace 7bc9597fd06ae89d ]---
> > RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
> > Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
> > RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
> > RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
> > RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
> > RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
> > R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
> > R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
> > FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
> > Kernel panic - not syncing: Fatal exception
> > Kernel Offset: disabled
> 
> This looks like it may be blkfront_closing() calling
> blk_mq_stop_hw_queues() with info->rq == NULL.  info->rq is only
> assigned in blkfront_connect(), which is called for state 4, but your
> vbd never made it through there.  It seems like blkfront_closing()
> should NULL check info->rq and info->gd before using them.

Care to send a patch? :)

Thanks, Roger.

