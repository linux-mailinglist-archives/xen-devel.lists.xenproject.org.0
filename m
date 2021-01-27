Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01357305672
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75843.136672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gmt-0002kZ-Pj; Wed, 27 Jan 2021 09:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75843.136672; Wed, 27 Jan 2021 09:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gmt-0002kA-MK; Wed, 27 Jan 2021 09:06:55 +0000
Received: by outflank-mailman (input) for mailman id 75843;
 Wed, 27 Jan 2021 09:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xld=G6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4gmr-0002k5-F7
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:06:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f568ec6c-bacb-4010-8079-83ebb00d3b43;
 Wed, 27 Jan 2021 09:06:51 +0000 (UTC)
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
X-Inumbo-ID: f568ec6c-bacb-4010-8079-83ebb00d3b43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611738411;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1lFgPugJ+ilWFD/QslbUEL4s6QJxjmDb1sjfGNw2AbA=;
  b=ZNTBJlw/2xcigXG59IqAHQp7wiGTBNL5sD2jbxsI2UXQY3/Iar01UAw5
   MDCc+v1UfQDqZe1DEpMf4EJt+cra6FenkRc6i2KSxEfu5wkR/UQjqd/WZ
   kvdMuQ0Ws7TPdAc57qjEt3/HTW1v9Rt4B44N/oEn2JAsp4nt2WMLP9KJr
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C+6/zRJoPKr958V8W5hYDkjZTspowD7w4IP/fPfrymeOLewiaPNLL96LBhj9nEXfgbhgMTIfwJ
 Yittdcg0NZvBpIMiS0i+g9NfP8wvv7JgK+EgKUFh7/QoP/jeptuasThFa2VOg/iuCh6uMtXwBE
 C/WUMusRuaCXoDTV6zf7eSGIBcTmFSwNrjPm8R3aYvngbhgevPlPU5M7LlOzLdK3dsEfvKvxC6
 Pz4SHcaSZI1Mhnb+FZWTHpHGZVRVTJi4hQoNvjHgdWKNQSz8zkfMnj21JgkMbW0dT3NfgrDJgZ
 Exo=
X-SBRS: 5.2
X-MesageID: 35905917
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,378,1602561600"; 
   d="scan'208";a="35905917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpJanDluOcxXg+UPLoRWZwZJyJouyF779vtVpsAyzyEsB7M0sODS8r8NXrQhhy5+oKYzPqxoS+/aJteIIHNnLmoVDc3/OpUUHuXJ6qHALfIp4aDQv1Cx+uFNTsZYtsExPPsdueCZT3fQeMM/cvSeRYg+RCnXfaMke96iR41xrUIthIKnSP8y8Ujgbtz5+UgwCU6an5tmzVDIvgOAG77tBIc+t1Win2JnEnnnoc4d+iYBvvMQ7Vu9Uwhv3aGGNOLsgx4h5RdrKDOxeHQ/xnH2+zkTzw81rOYUgqVG/1sgnyi5uCea5nr0RB8rFVaHeerVsrgklBhdLj9C+CkNBTyYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfZPZPc8rhMC9aLWZU/Fyg5CKFAF2OI06+iPY8s20yM=;
 b=dDBb/EAs6SyrSV1qC03CV69xdDzDjDrAqGTW0qjexwkLrDyVxGj33XCEwDm9WTwi+7OZkpOMG1HEyoJo5RoaTKn7CpUGDy2+KmggLFwGSxcLETASwPogP6OqvyjHjYhsncEhuqVjMb+wQIQm9HGkMU+TULD8khvY2RG3ASSnXRvIXEzSZ14H6y2KAJShkGZRGC1ts7eRkYKkPvYYCMhsXPvuo2JLj3ZgeQwfQd19HShC/wXz+lh/88YSH1lZS2/91c/doTREHccuexwzEdvQ436uWGs4vU0XEmngHwv1ydrLfsciY2GnZFZcvic9EWDULh2k+9RG4Xdsgz1BUjpUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfZPZPc8rhMC9aLWZU/Fyg5CKFAF2OI06+iPY8s20yM=;
 b=VWeNxrz0k448AWjbX4B3CPtuey57uWVI13uYdgGjl56plKrrsMtNtaIiCArkwMbIeHxQGl7E4vaSuBKipyFLTpkyUh0Ud25Pt3LQAF7gHK7YKoj3OL44HHBuQNqJY+QXozkSKkdBu2JMJIS6D7+kgduU77SIEuID/Tre69FBU9U=
Date: Wed, 27 Jan 2021 10:06:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210127090140.qaqkvtbdkkasdd55@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
 <20210116112502.GA1133@antioche.eu.org>
 <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
 <20210126224223.GA3740@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126224223.GA3740@antioche.eu.org>
X-ClientProxiedBy: PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cea1b558-229f-44ab-6a26-08d8c2a2e08b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB429882B7F7C882722250F4E28FBB9@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wtPM4M5ZpKWDTGhvpTVP9P3oxGsFFy+ODKLeg1YHiF8bAG2BtOA+gnlVmPyMOe29p8UEewxAzCXQeH/UDLC7CFVsEckzGNILbrCwUtyhEb2kak07yEFsrUvRhYzf+TqexCRrqMRc88mAHqnp75POb2kmv6MP3k1C1DSoVE8nUEas7zCHZHkMIk1cE42utUzvEcmDfCobX74fNKCm5iZNAc2Ae1jxcHLjdzxAOPhZfrk3eyO5CEYs9xvkSNVaifKH2ccWqWs5Kgl0+NViik5VF2TFMk0XLpBtuzZNGw0TTqGd+u8NK5myI7yU/1SBc6H6yE0QnbbZznUF99IVYyqPPlVSszx7gtCEQTTQJ3jX5VLxKQxpHZDAHxrqgYAMhp0cybxg/zgwRR7RQsfBpO9oJSHpF/8txvpx8Vp7w4np8C1INSVMYa9NAdTA39YqdlyOwzhgRndtrTWqwOTsbbOr6XmwJvntL4uhcUmnrcaqI2qMl3qIUlSmEdTMF5hcT+D+YVznNi71SQEVp8WmU0OMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(8676002)(2906002)(6496006)(85182001)(107886003)(1076003)(86362001)(478600001)(186003)(54906003)(26005)(6666004)(5660300002)(4326008)(6916009)(66476007)(6486002)(66946007)(33716001)(8936002)(9686003)(16526019)(316002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlE5MUd5UU9zMzdVQnh1OHJUU0ZlM0tKQzF1amtHNlZQWXpjMlFXSWFMbzRh?=
 =?utf-8?B?blZHMVdKV0syVVVYOFNLTXJFalNCVXIwcStPekNlTk55aXBJd1NJR1ZHanlR?=
 =?utf-8?B?dFBERk5qbVFrVSs2anRzbEFhTVlYSlpZK2pQcUVNK1g0N0YwcWlXd3UwUEpC?=
 =?utf-8?B?c3UrMWhJRFRBUUZRRSs4SU5QaVRRbXVHUUlnVGpLUmtPcWpjWDlyRGZXa2du?=
 =?utf-8?B?eHVkemdlSy81cmJ3bnQydk9tMUtYKytGRXRiYTdaeStaZkxVT0VlbS9ES1p5?=
 =?utf-8?B?V2FaSVppVmhNcWRMbWRocDlRUU1GMDZtaVc2M2NON1lJcHNwL0lKd3gxSi9I?=
 =?utf-8?B?enFZZTNKN2ZXMGxiUGRmVnRFeTNYZXdFcFlmV01GUjVoWHR2RkNOVzl1WXJv?=
 =?utf-8?B?Z0U0WXMza29LUkR1aEJyNVN3U0s4dk1FMmw2WkVXbkRic1hraHBmWWVVYi80?=
 =?utf-8?B?K3ZFbG9ybklGY0I5M0RLNktHN0FneE8ybFBaOXNWUWMyRkFobGROdldDZGxJ?=
 =?utf-8?B?RzNzUDd0YkV0Nm4vajV5bjFXSm1zdjg2UnZFZVRzZG4ySzUrbGxkU21QaUdm?=
 =?utf-8?B?azhCL0N5MEpqYnp4LzZ2V0pEQmlOQWJzaXpOV3hMOENLNFVFWHVkK096VzY0?=
 =?utf-8?B?eHFzWWR0cTJZc2drNER2WmhUL1NGWUNvSUZXN0xCWks0Z1lkaXdIVWhhWmM2?=
 =?utf-8?B?Nkp2SWJYYlU4Ym02V25zam42eFpONFJ3NVcwVzVocmZjM2FnQmZWVUFiSGxC?=
 =?utf-8?B?Mm5KdkQ0MTFSanpuSlhvRitjaWhEMWpJRGd2WHJsNlJtN2g2RlVYMU1sR2RF?=
 =?utf-8?B?K3A0YmtLN2VSTjZwTXhGTUp1ek0reSsySUI3MGdETXYxcm9LRURtS1AvQmJU?=
 =?utf-8?B?VUx3N2VaN0xBRUFBcU9palRiYnpyVWRxa3FvVkxTVFFod1M3b3dKdlBTMVdt?=
 =?utf-8?B?c1BqSzRuUzU0Zi9kOFBnM1ZWUWJJSWZrSm8yVDVraWd5ZVk2NkdES2JUWEFa?=
 =?utf-8?B?NzRid2ZSL0cvM0V1RHlSQ1piUm51OXgrNXh6Q0pmS0tKRXpDVWtZTVdTeTY0?=
 =?utf-8?B?QXZINER3bm5yTGV3ZTV4cksvYWJhS1dDOTA5eWhjV0pwZ241SVR5dFdOeE9Y?=
 =?utf-8?B?bE9pYk1NVzYyWXB6WTVxR0pGZTdMSXNCVENQOXZWL0NDZE81cDBDaFFSdFF1?=
 =?utf-8?B?N0psY05PbkhUK28vS3dMUjJaWVVBMzB5SDdybGtNamVEb2dRUXY2TDFUVmFH?=
 =?utf-8?B?eTFNcllXNzZyOHJjM0tERkxvd2pRYk1tR1lOQmM3ZEJkekFySCt5OVhPMEhE?=
 =?utf-8?B?Z3lOdEFsRnRsZ2t5NGw5M01wdTdRMEVmb04xbm5GWHl3MHY3NFdzaU9Cdkt5?=
 =?utf-8?B?SnovSDNLNFpoMlhRK2Z1aEV0dXJTL09EM3JScFQ5SUtHQ2V0OFlZbWxLM2xR?=
 =?utf-8?B?UWZhdlF0aEpyZjQ4bitRZk9iWGdYS08vbDVnUUJBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cea1b558-229f-44ab-6a26-08d8c2a2e08b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:06:48.3376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwFoB4b3QbxZIo63VaBv2vZS3S6fqchg2KYx41gT+kmqnoq5ACjo9DfJk7Dy8Q/f8ZjtQOdnvY1ULLS7WvQd8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:42:23PM +0100, Manuel Bouyer wrote:
> On Mon, Jan 18, 2021 at 09:36:42AM +0100, Roger Pau Monné wrote:
> > [...]
> > 
> > Note also that there are networking modes that don't use a bridge, so
> > you could likely end up with nics[i].bridge == NULL?
> 
> I couldn't cause this to happen. If no bridge is specified in the
> domU's config file, qemu-ifup is called with xenbr0 as bridge name.
> 
> I tried this:
> vif = [ 'mac=00:16:3e:00:10:54, gatewaydev=wm0 type=ioemu, model=e1000' ]

Right, that's because libxl__device_nic_setdefault will set the bridge
field to xenbr0 if empty.

I'm not opposed to this behavior, seeing as we don't have much other
option I'm afraid. I guess we could open the tap interface in libxl
and pass it to QEMU, so that libxl can call the hotplug script knowing
the tap interface name, but that seems non-trivial.

IMO if we go that route it needs to be documented that NetBSD only
supports bridged mode for emulated HVM network interfaces for the time
being.

Thanks, Roger.

