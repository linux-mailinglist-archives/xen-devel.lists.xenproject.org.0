Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8337207E1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 18:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543215.847993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57uF-0002sD-Uh; Fri, 02 Jun 2023 16:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543215.847993; Fri, 02 Jun 2023 16:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57uF-0002pI-Rs; Fri, 02 Jun 2023 16:45:39 +0000
Received: by outflank-mailman (input) for mailman id 543215;
 Fri, 02 Jun 2023 16:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q57uD-0002pC-UE
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 16:45:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e082fa96-0164-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 18:45:34 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 12:45:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6353.namprd03.prod.outlook.com (2603:10b6:806:1b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 16:44:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 16:44:55 +0000
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
X-Inumbo-ID: e082fa96-0164-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685724334;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pmrG0SzB7w+gyctfHkUXMb4Y3aaoXaywQdgBn5G1kis=;
  b=IAyuolWT1qXWoK+B4SQPZkitUoZnP/OOarPhMwvKRdtIEncO/aLOlYwD
   46wxzLlVAg5vUUdYocmONbUCm/SnBDzxZltVi0ZmSN53A2OWv/vQXC6oQ
   IIOlBFpaIxRZglpqoktqHzJygBfGXPshMg5b1+54VNLXfYUDJqSFJh+LV
   s=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 111412453
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1zIA5qJFQonvNmmeFE+REpQlxSXFcZb7ZxGr2PjKsXjdYENS1DJSy
 2FMXGDXMqyKMGH0e9EnbYq/9htS65WAm4QyG1FlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARkPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5aG2NH/
 Ns/OAowZzKMnPqrwLOybsdz05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqiBNtISODjnhJsqAyj5G4aDCwUb1SimP2IsECCd9B8A
 kNBr0LCqoB3riRHVOLVVhm1oneCsgQbHcRZF+k36galwa7T/grfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrQSv5zHajzicf6cQwc2
 BiPpSk6wr8V3cgC0vzh+Uid2m3y4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1QR9lFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:rSO0QKMIRXOXlcBcTu2jsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5O0tQ++xoWpPhfZq0z/cc3WB2B9mftWLdyQiVxe9ZjLcK9AeQfxEWptQ36U
 65SdkENDQrNykCsS8m2njeLz/9+qj+zEl3v5al858DJTsaDZ1d0w==
X-Talos-CUID: 9a23:Hs6rRWPgy0aceO5DdTNl/UczPdAfT3T/w2zIPk+5AEJHV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AvcaaBA+Mkkx9FOP4kx+plxyQf5ZYwaanDHEPq5o?=
 =?us-ascii?q?fgs21DyJMFzW+pTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,213,1681185600"; 
   d="scan'208";a="111412453"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC0lQchQ59PwtjbY+iHced1nCrpyGoTGX/Pz3dZ0pAvfdmR6ua8yFEU/WUV+5y7vN4rGjApwRMXKFHN6T3EEdiyYwIWlqKDQSw+sDolcUW7pzI8TQBl0ih/+w5CK7DKtFxPQfq3fVKP1olu2F+nLwdZ8tNt6zRCFeOPmHTKDT7bywOqS0luyqwX5vMlmNk0e+Uy36XxdJtCpVG2LPbvZXdsnv/IJf+evXmPazAW8xPA9ptASAZBOmiiM2j9eRAoS9KCGI5mvTGjhYc0Z5bnKR6kD5CvHV+JDx/vc6JAubkxrUpAApqnPF/2LRx9h3nnO/bvJp3pSKvqh3UWobeBaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmrG0SzB7w+gyctfHkUXMb4Y3aaoXaywQdgBn5G1kis=;
 b=IpEEb4WbYB9NmbH86mQ/JehXoXtaNYAoO8EKs3P8Tq4SqKW5HbYQblNMKcLM3PXFFFQK59SYAWuc0WcD5CHKUGY/6DC2thK6p5onTOqD797U1Dra2RAB3v47Ov37f73I0FAJaEMICLKm7zm/lbrm6788kF4UlY+ZDBNDXTb1sixic+QHCWfucfrUZxTLnU0JvciMj/UR8EkiYlvUXD38dw5Yk30txZvz5NsUjuuW581SbL/JmuUburm/a6hZ8klUhRMvkNAOQx6xi0sSfjv4nI5qhuHRmdQEtUcw9dUZy0z8F5cCSuQK0tYMkLveT6MPl2sU8v48mrzLVjHQPUYSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmrG0SzB7w+gyctfHkUXMb4Y3aaoXaywQdgBn5G1kis=;
 b=Wms9vIVG3OxqtJpUpHkS/ONB+LtAgYKSibMzYhXsNJWTY0zswqZNrYu3LhoOEEpuLi7HIBp5GwdtPMRS/t2dUdQJmyGscCMTSad/vUij0uu186fAk0pzwksNAqEX0nxJLnGwu+bQR0u6bjx5zOsI5lLhRKwlz1YR6/gtCIFCpzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4d37f80c-82d5-10b8-2e11-67cbe49f5012@citrix.com>
Date: Fri, 2 Jun 2023 17:44:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/microcode: Prevent attempting updates known to fail
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230531175119.10830-1-alejandro.vallejo@cloud.com>
 <83324533-38da-b5bc-875e-a161d7501eb5@citrix.com>
 <6479ec49.1c0a0220.af185.1f3b@mx.google.com>
In-Reply-To: <6479ec49.1c0a0220.af185.1f3b@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0468.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: c208e9a2-5c3c-4d48-3160-08db6388b18d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jsiqy8fGgOw2PuDpLMOGTl4/yjyPTM1+P3zSvHw7B3TwQly9TgAu/DrJpKdO2MW9ITsFXYl6iiGKXl9ixyW7tENnd/t/oczL2+2tN9rRA66afFPtLX3R97VkNmsOn7E8lEFP8JxV7tic9qz1H6zwT1UURH+9FSfWVZICuPjDSO9v6m+IjX8vHtSRvQhEYrfwkh93oPDf+NlOr/CqQPgpOlLGnz+iHR8SGS+Nz019p+jD53tfNqyYZbPw3MArkCqHCrn6hfMgLVcw5x+NqAI/uDOvic8k+7FJz/22Ctklc9td+ALGwT2SwtvBZNTwoU/BwY3Mwwt+fJ9yFceD0xVY5r4XqtnOdiepxkMjRVqaP0hJY3eoon0wdFE9KkCTZ2lMdfZp5O6o7/eZHuAChT/ibZfdi0pcdfnYtBKDUpahWi0curYZb64GwJ8Y82rm36IhkwEkCPVh3Cxe+mIlx/a2fK1U84HTj0FI7taVTo6O6cY2gZWND+8GofTTk2Yaljc10ZpkWvThqlZZN3yCYu2I3XyPU7qaI8tSW1E3plOHcLFic4wwYT20+9qzQfYVI572+qTxWi9dnVl1ALDHaXArV9HiF0/Rq7M6j3eTR16q5toC8uB2qg5a5uutYeugTDuBnpXDGXcrEkH59CQRjXWH8Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(6486002)(6666004)(36756003)(83380400001)(2616005)(38100700002)(31696002)(86362001)(53546011)(6506007)(6512007)(26005)(82960400001)(186003)(478600001)(54906003)(2906002)(8936002)(8676002)(316002)(41300700001)(5660300002)(31686004)(66556008)(6916009)(66476007)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkx3d0xhd2c4OVg2MFNhOXhmem5GU1dSbHNoYkZ4Y3Jlckk3dWV1RGswd1c4?=
 =?utf-8?B?NzRXMWlYSXlKUWlmb1hBVGRVNUF5WDkzMGttNHl0QTZJdW1oc2tVb2dPY2tx?=
 =?utf-8?B?b2p0cW9NcE41MGJycURrc0lBbjVtTHRQZ3BqSHZEamNOZnhwTjVaYTlnY0FD?=
 =?utf-8?B?NWx4RWtVc0RtdXdrZzdWd2pUR0ZTTGRneHJvcjFrUlFWUHpVaWpNRmhBYlRo?=
 =?utf-8?B?emo3YjNzaUlqdmxYc2ZqNFJoR0lHVEdCV2J3WjhoMmlYbHZxVHdmNE4yQXEv?=
 =?utf-8?B?OCtQMTVZWjEreXBpTnVLdlh3am01ZnR6QnR4QW1hY21yeXJ2K3RlZERNcm1K?=
 =?utf-8?B?bmYyaGdHZnlKdC9obGMxS3JLS2RwaVhMc1RkQmZNNjY5QkhKdUlSM1J1eE9v?=
 =?utf-8?B?VFlucEMzVWdRNXZBYlRWVUthZlk1cmxSd1hFVFJpTkM3elZDaTUrWFFQQ282?=
 =?utf-8?B?Tzk4Nm1jZ2NvcXVMeFlqc3BSY2RkODYreFBEZjh1c0wxM1FZdWxRTDFyLzAx?=
 =?utf-8?B?RG9uaElaTDBLZndCbDlacStKRFJ4ZGZxY2QyMjhEdXRPME1mM3FHZmxLU2NJ?=
 =?utf-8?B?MGRQUWJJNmhLTENiRnh5SzhaSmFaVFBFZTNDRlBMZXZkL0xWdXVwdVk2aW1k?=
 =?utf-8?B?OG9GZWtuRk1UdmNoTVZhMy9ueDZWQXh3WUZ2NVNrRE1ibFBWZzlVVStrU3Mr?=
 =?utf-8?B?UjQxVnpoblU2RG9UbHpSTkZnMTlOa2NXNG9Ndk5ubjJ6L29oeUYzZVA3YkRY?=
 =?utf-8?B?TFVUcFByOU5GY1Zqc2N1VGw1VS9uTmNQVlVnTXM1SEdUVll2c3Y4NG1WZXlm?=
 =?utf-8?B?UlpiQXZmRGszNzhNRXZTU3BNN2pwWjBZMFBzWEZzcGZxa01WVnhIKzlZTDdI?=
 =?utf-8?B?TCtYb04vRS9LTzc1V0xlanozRmlmUys1TU9FM2tvL0U0MVh5QkFHbytaOTI5?=
 =?utf-8?B?bU9YWXE0RE5IRXpJSWt1NHVjeDJkcWhrUUMzc2YwTldOZ25UaWd5ZFYxeGFt?=
 =?utf-8?B?cnNwZ1NwZVVTTEdvd2NPaGltN0NIQjJIQjIydnVBOUtSdTNFS0hpcXUwYmNW?=
 =?utf-8?B?VWFYblJFdW1mekY5Q2VmRmdZOGJPNnEreHROL1dRZkhmbTJBaUFuK1Rrc2pJ?=
 =?utf-8?B?REtFSEpwajVXbWZBcEFncWFINTNoMk45VzUyWFJZVHZZUnJ4eS9wYWRzMVoy?=
 =?utf-8?B?TzJyOVVSYXZEQ2NKRmVKcXhFeVROa2IvL1ZGOVFlcFRFTVNPbVNLOXptcDFH?=
 =?utf-8?B?MTVNV2NGcElRTjU3RW9pRllwcWl3NWRocUtMOG5qenBpU1dDTkx2YlppQ0xt?=
 =?utf-8?B?T1dWeVI5dm1Cd0VtVWRIREl3RmtmaEJRZ25EazVCeUo1citxT3NNUld0Y1Vh?=
 =?utf-8?B?M2ZsNXRrK0hzQllCa1RObGVPZU5udGR5REdvbmJxMnk0a0VuNTVSdTU5MmJi?=
 =?utf-8?B?bmdqZFNIcnhGZlZqZHozcnF0cHExVTdBQUFXNHdRMjNjdVR5dUhkc3VZL3FX?=
 =?utf-8?B?K2RmRmNuSUk0MjBEOWpid3d0OEhTNnFxVGYxT01leitucnhqblM4NFMrNTJi?=
 =?utf-8?B?YXBzcmdhd2xnK3R6bjlZeTBJK3FaNS85RDJwTkppTjNQYmVmaVpOb3FxOW1j?=
 =?utf-8?B?VndUemR2WUViNmZWSmVYdUE2eFl1SlFLaXFTWFRVRTFkck9sY2g1N0VobjNS?=
 =?utf-8?B?ckxHdXU4Y0RnZ1dub1RBSUFEL0d3WnhUTHF5YmhSVkxLdXFVdEUzazNuc3Ni?=
 =?utf-8?B?TUtac1VHeVZIUUZWMmpmYjlJWU40aEw4MVFLL2RYSDZieWx2VVlqcUI4M2dB?=
 =?utf-8?B?aGREUHZxS2RBRWR3OWwvQjVLZ2RXZzhGNHZTV2xDRjBVcURBa3lGTzZscXor?=
 =?utf-8?B?cURhbGMzaU5WSktQZW9HV2dwUUMweU8xRGQvRXhRbGU3ZjJVWHRLa0tVUnZU?=
 =?utf-8?B?YzE0NDZ4dTV2NnZyN2dBM0NQVUNJRmxNeVI1VGMxZCtTRVE1VTNBaUFvanFn?=
 =?utf-8?B?ODhIaGt5NXM3bjYwYjVyZUxUQStZbG9PK0pWRzVFVUJoaGxuaHBCN2Vvenh4?=
 =?utf-8?B?S3RqcDg0azE0UjNQY0x2T2xsVG1hQlBFdGZlR0RyR1pmb1BWcVMzYkZkbE8r?=
 =?utf-8?B?ajFRQ0RjWlZDc3Npd00rN0RJSlc2TmdsL3JOMHd5Vk5YbHdHK1B6Z3lKZWpk?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TRWANUpkZ9YO56MmtQzm3rgF9R+grhRk+GMO1hgNFPIbJalwUX5AUDbzMZNW/pI+C17B+4moRmfRAuZjOT1D+xmOgOoY4q4oJWa2SFDqCSxrbvRp/s989L9q+AWL8Volw6Nue8it+y3zzj+TEr8jyqsQv9nbvTtMkIBlluhVHVtLH/JnO5vTibyqEw2AOTKySCpehBSCRjvPK6Cl6O5NDzv8ZkOCzsWc8kOCrwlpYplfv2Z0w1E19KQ7vUadL8W3pD2cHQ1MjkuzaOkUyTwzP1ifrpL3Cyy02mY+dFAoGdkzhx+C5tKQoptlm+MpSjNfDUwt3wAP4HdWhuSleA67y0hWY8QTkCWd/YKR79L6IJVUwNqvrW4/feQyfGfGaFD/W79Jv99ESVVYCfCc6mjY+jj+oajxafh4/FBxEH6e51YNJ+s6mXMbpTDsJiX/MiqVFMd3rrkhqwboKLyi3q5jf8fIw86GJ6KbGels+QDym0t8sZw+fox/dIEDRG1Bl3ATmxL97xiPOpV6gkOZR0CnCa0J7D7cZ9ixzh8zaRW63Q37HZrWALypTZ+llaneMc+xWm9ewXdhi7yP9jTYx6C+W+Bec0PkMRDV3U32BcA3j84w3XR60KsMq8tHwbO8adOJdcm4YUnGstpozuYIruoPzc/mbRSWEB4Ukz9jo/jJnfwIF4EbVcmeDShNmXr67ZCenrN/2Ul4kHCyYPpYRMMyKqcqjT0H3JvoMqMn4JHWMJyPxN+s+UeyRpLGuH0Y5eJqQsVlQhMjDSqmprf0vQyZ+XLhZUBLGTYg6KwMlYCq6jBtxa1elgyQOf/su1yYTvoCNEsYNzl7pmgabsnnBeEg8K1bpntn5wHmNVJ9Fml7RlI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c208e9a2-5c3c-4d48-3160-08db6388b18d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 16:44:55.2594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUGVzHrHUXmWLTLMrxNxGmwLqx+VyuoHVnfzXx6rsYWOFKPFTRvbB9cIqspyOr/A9+4hEizJCetBjBotcPlWdyDAjLSSMLeuzJ3flnB9qbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6353

On 02/06/2023 2:19 pm, Alejandro Vallejo wrote:
> On Thu, Jun 01, 2023 at 11:54:31AM +0100, Andrew Cooper wrote:
>> I had something else in mind here.  Right now, this will read
>> MSR_MCU_CONTROL and emit a printk() on every microcode load, which will
>> be every AP, and every time the user uses the xen-ucode tool.
> Not every AP. The hypercall would return with an error before the APs are
> brought in. It is true that the error on dmesg would appear on every
> microcode load attempt though.

I meant every AP on boot, where Xen initiates the ucode load.

>
>> Instead, I recommend the following:
>>
>> 1) One patch moving the early-cpuid/msr read from tsx_init() into
>> early_microcode_init(), adjusting the comment as it goes.  No point
>> duplicating that logic, and we need it earlier on boot now.
>> 2) This patch, adjusting early_microcode_init() only.  Have a printk()
>> saying "microcode loading disabled by firmware" and avoid filling in
>> ucode_ops.  Every other part of ucode handling understands "loading not
>> available".
> Sure. Going on a tangent though, I do wonder why tsx_init() is preceding
> identify_cpu(). It's reading cpuid leaf 7d0 simply because it hasn't been
> read yet, but it's not obvious why this rush in invoking tsx_init(). I
> can't see any obvious marker that affect the following identify_cpu() call,
> and swapping them gets rid of the cpuid read.

In __start_xen(),

    tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */

If you were to test such a patch, the test-tsx ought to fail on SKL/KBL
amongst others.

One of the things that tsx_init() does is select TSX_CTRL_CPUID_CLEAR
and/or TSX_CPUID_CLEAR, which hides the HLE and RTM bits in regular
CPUID, so wants to run before the general CPUID scan.  This matters for
guest performance - if TSX is actually always aborting, but reported to
the guest, then any library using RTM will be less performant than using
the non-transactional path.

Conversely if the user wants to explicitly re-activate TSX despite the
firmware defaults, those bits need clearing before the CPUID scan for
anything to work.

~Andrew

