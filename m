Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B833C88C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 22:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98118.186010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLutp-0005sD-BW; Mon, 15 Mar 2021 21:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98118.186010; Mon, 15 Mar 2021 21:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLutp-0005rq-7y; Mon, 15 Mar 2021 21:37:17 +0000
Received: by outflank-mailman (input) for mailman id 98118;
 Mon, 15 Mar 2021 21:37:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thco=IN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lLutn-0005rl-3G
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 21:37:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfd5f154-03b1-452d-b936-92398b91df6e;
 Mon, 15 Mar 2021 21:37:13 +0000 (UTC)
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
X-Inumbo-ID: dfd5f154-03b1-452d-b936-92398b91df6e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615844233;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eRu/7QqXV1LPazAGA0S5MkY2tmMDhj80miVMAVapgUQ=;
  b=TbBGqj+TVEWY5HThlr7kP3dk5XbLLYOgJi7OsPDfVTyCY+dSnxbpeXKv
   BTxISv3YXWWwgZ6XQFyPU5CucktKD5d/yWIU5pE9sJr6LbrJKB+pU/uiY
   RSsm+cE597f103MUse9a+DRESI3uh8ZEnAb+liyXLDHbWr7aWGwkfC3DQ
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4Iw5HmhmtZ4ranGuf4ngl41MFDYwhLukpq4zOgvGFKd2mkkijhAOtdCveLJGLhGjQsXjs/t7ni
 tH9Vupxq+8+OuqSHVU0YXsXcWdL/t2o1omjDtP3Lujolo5kNAvPP0q/mKBDJD8ymkWTvNEOGn3
 X9GLUUL43JLvBLAzOMZ1fsysEc0QrYgEhFa2JksSkyDnTmp71CAgPvvBbGBkUPFBbIpxLXeowY
 jt3s4fI0wIe5BDBdfUr6+2pWU9rd4oNZ8tQvMxDQkkz9I1JTEWUPEX20AkBB+/O9f+cmwszmye
 1+k=
X-SBRS: 5.2
X-MesageID: 39237852
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YDnL4a6mShye/30FCwPXwTWEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbTqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH76GL1MCWPXOoMCOqYL+bXc9dmUawSStrRft0r71FBCEwgwTOgkg/Z4O+X
 XI+jaJhJmLnOq8znbnpgruxrRQ3ODs095SQPGL4/JlVwnEriaNSMBfV6aZvDYzydvfmWoCtN
 XXuR8vM4BSxhrqDxiIiCDg0QXhzzoigkWKoTTz4QqB0L/EbQk3BMZbiYVSfgGx0TtZgPhG3L
 9WxGXcjpJLDHr77VrAzuLVXBJnnFfcmwtFrccviRVkIO8jQY4Uh4ke8ERJKYwHDSL35as2ed
 Mec/301bJ4d0iXYGveuXQq6NuwXm4rFhPDeUQavNeJugIm1kxR/g89/ogyj30A/JUyR91t4P
 nFCL1hkPVrQtUNZaxwKe8dSaKMeyHwaCOJFFjXDUXsFakBNX6IgYXw+q8J6Oajf4FN5Icumb
 zaOWko+1IaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nVWKfrCyueU1oj+vHQ7Mk3M4n+Yb
 KeKZhWC/jsIS/FAoBSxTDzXJFUND0wS8sQltEnW0+fg87CJ4Hw39arMMr7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVzwVhrWCw/C1KM1NJKf0/kYyYALOIEJmBMSk06F6saCLiAHlqQ3eU
 B5MY72i6/Tnxj1wU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//KSZH5Vx3nCAhNkVcvZHE
 p+qj1MiO6KBq3V4RpnJ8OsM2qcgXdWjmmNVY0glqqK4tqgXIg5AJYgUKlYDh7KCBRxpAZvpA
 54GU45b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+aiV+Rvvg1RnwQXyenVOmehQpGfUsQun
 RBt4skxJaQkzemLmUyxMA1KkdFZmisDLVaNwidf4lPlrf3eAZ/cHeSiVWh+mEOU1uv039Xqn
 3qLCWSd/2OOFZbt3xC+ovB8V9/dAymDgtNQ0E/lbc4OXXNu3513+POW7G61HGJbEAehssHNi
 veXDcUKgRy5ty+2RKPggyeHXE+yphGBJ2YMJ0TN5XonlWjJ42DmftYQ7t6/JN5OMvvteFOe+
 SFYAORJC75DeRs+wH9nAdRBABE7F0f1dXv01nZyUL9+lgVK//bOk5nSLEWOMv01RmTe9+4lL
 FCyesotu6xOFjrYtGIyavrfydOQymj01KefqUNk9Ropqo8u7t4IonDXRbJ3H9B2g8iLM2crj
 JrfI1LpJTAMJRoZcocZmZw+Ucojs2GKCIQw0TLK957WVEmlHnAOdyVp5LOtLo0G0WE4C/9I0
 OW/SEY3/DLWUK4pPUnIpN1BWRdc04n7nt+uMuEao3LEQ2vM9h5w2DSCA7LTJZtDI6fGbsRqR
 5m49aH28+vHhCIpDz4jH9cOaJB82GuXMWoJhmDcNQ4tOCHBQ==
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="39237852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7TZf3OM2nimhrvQh7fb6lQmBzezuyr3S16SRGxiIpINK454UIv/+TGJ0cJh1owAi4U+Fivvs1kc4vQi8JkGFr1uUxa6x2Y2NcyxfNggzlBPAjfzzni9JPKafFDYxswgHrnegiY292jDFTe0qTlg4cE7KQsf+5X4VfipWOO906L48BsjYKeuT3hPaFwW/S105HL27+Rqp8SfWvjnr5BjvWMptxi8H1MPA1Hd0dYS0F0Cv2eU1O5o3u+Gh2IsGoCaM5lAkrgxfNnSZg3NPaMhxtXoQH2QBhqeCbwTo/d7zCWMrcVuLxH24qUMcz+/vHDXxSFHHGVzYRi/Yl5YEWoq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7AyxiCcAH4B4EZ0LcKoBMEivcT6RAuzIBjQmcVou+M=;
 b=RfYVGWq3SwdesCcw1h0J1C7cWWIog0c3oOzay3fxkbQT6oYxt3WszUexHN55tBIMUxfpPcY9IeEh+GZdgR98SY+fxSIvtGzBGaEDUumw9jg6Ee3RCubwvRcQ7XR13kX3uLJgd/fsbM1GS7nc+Bz8jNuBlPC7T1dciuzV/35XMPPOqySMfTXckCRhstE+GPboFIlAlMpA13s3/Mz32BJ7IWs5a2hf/Mhc3UqFl2RxXlGj6Fq9AuqQdWGUy0AxQI8Kbb7LsG71TFdTVZdcnycitdrAOzzK+VVx2OM3qgIwG1YGen2dBHTecfQRgcea+nEivfa5Et2Eyw9DsO6yHuEtCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7AyxiCcAH4B4EZ0LcKoBMEivcT6RAuzIBjQmcVou+M=;
 b=U60qghwzMX52KnqTODe/02y5mihivZBqjiFdUouQ3iP6mTvr7/Cep/YGWACA3k27+Ejf9sPxRLHG2wTb1riBcRJ3g81F94wWQsWr8lpfJ6aC1rDG4rhxL+As3oLqeLORWjagaVvm2ZInbPU0b6iFSqZjrlKAgf9iu+SlUG55rlU=
Date: Mon, 15 Mar 2021 22:37:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: 4.15.0-rc3 can't create domain when dom0 uses newer kernel
Message-ID: <YE/TfarPGdr9D7HZ@Air-de-Roger>
References: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::14)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6415a71b-020c-48c4-e348-08d8e7fa7ba2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2969389DFEE945D725DB2CFC8F6C9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: czTITJCy70sZrNWQJ0/TlebKbMbrh0qm067s7j0OMnSJgIAyDA8jEkFTPjkP8fom8JNmlWqUoBGDsiMhPpOGJ9xNBzYnpUV9oD7DJ383zrO85fCb/5fqLu3oFLn4D3fUNJT16dJzCPbRJ6ovx69mPLAXsBpfjBuxutpi5u8W7nEXyFtJVobofkv+UdKbv6VuJ0ZCXSdpOE/s6N1De87SxFIxNiFX56+yl9OjaNwZefG48nG4nw7Mtl4SE3DQPVWk0WU1rJ1fYL29AwK2Hk9PNtBzAc9PGQ3tBU1TU992HySTr2iQaJo8ltRIzUhrV4Yx/FGkAIh7L/yp4umqYRdTiOjpivdBR7ETN0tqgwvnKju0gYDbQ9oukeH/hT8CoRwtISJBRpfQjWfhZus4OW8QeMdf6qwJh19zeV3KqVAcco5va0zQh42CYgr6C+XqU404oYf1UGgnJNsacSu9trwdCk90ppVtf5ZSEFGvn4JGTmVfm6ZNqh78819hEEhZoHIui4cpCwAVTe/xiLrbIDcbNuFKypR3A73PFqCje1XYbKMHR2S/hEQd3WX1gNws9xMh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(85182001)(6916009)(2906002)(956004)(4326008)(6496006)(8676002)(9686003)(4744005)(5660300002)(66476007)(8936002)(316002)(26005)(6666004)(6486002)(186003)(33716001)(66556008)(66946007)(478600001)(16526019)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3VDQU9zWG1ZVVRiaU1USHhtQW0vRnhiWEYvWEhlMENsZDg4UjRjcCsrdGU2?=
 =?utf-8?B?bzRwQ0hXTCtGeXJQWWl4Z0NycnRSQktHQ0ViU253UmxnZUdzazlVT1RGL0dN?=
 =?utf-8?B?Mys0ano3MURraHpCWncwTUdCaHJrYW94QUJRSVZOSUl3a3hpZHdkcUV4Sklp?=
 =?utf-8?B?bG5FdFJBWHpBTDVRQkk0SThEOW0weG1KbXE1VEFkeTh4OGJ0NFRWdFlHS0lY?=
 =?utf-8?B?ZUlxUWR0UHBLNmFTSVhzN1Z1Z0ZWdGN2a0tNOW8xbHV6MVBxUDdFUC9kbTRt?=
 =?utf-8?B?RUpnd3I5bUNjN1IwMjVNa1o2WGluWWpoY2w0Ky9rbnNOenorUnVCcGN3aEow?=
 =?utf-8?B?RjhUT3IxRlVoK0VZQUNmL0VpbCtiR3R1OTVUYzJLU0llNmZESE56OFFpTW1k?=
 =?utf-8?B?dXFjcXk5MjNyNU9UWnF2aTJKZjlpSkVpZ2VqMVlrRG5nQWNGK0tzelI4U3po?=
 =?utf-8?B?aDNVREFYS0cvbjJDZWxORFcybkRKME8veUxuMlE3SnJNZlcxeEtBUElub1pI?=
 =?utf-8?B?RnJmUXFFTU56TkpxcG1Xcmk4Zko2QVFxSVZrNGJlUGcvRzJGelA1VkR6UTUw?=
 =?utf-8?B?bDVyOUYwNGMzTjFmN2pyTlkra1JwTzRXQnFDUXRaRUZBV2UrWW9pL1R3ZC9D?=
 =?utf-8?B?ZnM3NDNYb3IzR2EvdWp6Y3krSzhnNXB5SG1wT25aWVhLemJqWlloKzlCTDAz?=
 =?utf-8?B?T3M0anFIejExRHY0Zm8rMUpzdnZuVmZWWExQQVpCeHZ4MjdRaUdWTkVsa1Ns?=
 =?utf-8?B?cmw3enVSb3lzQWZzWFA3bE1lU1hlWU9NS0YrUGcxQklycm1tTmdaTzBkclpu?=
 =?utf-8?B?NVdPb3lJSngzUzBqSWJwekdMTmEvOTRXVnZXNDJpYTZkZ0srTWZZMG4wSnZz?=
 =?utf-8?B?WDNQRi9VL1plWGdHYWR5RlEwd1JpMEc3QVJFcWpsaXFRVTc3VXlmbWxUdHgv?=
 =?utf-8?B?MFFEWWxHbU1qUThod2pEUGlGd2hldjVhaUtUOS9CeU90cHA3L01iUHlGT002?=
 =?utf-8?B?cFEwNWVuL011QTBNSEtmUXpaWlJLbjhEanBuSlJ1ZmdFNGphTFhBdFBwYnYy?=
 =?utf-8?B?cEJBbWp2bGNrUC84RHpZN3gzTWcvTnVNWG1mVDlaenZoZytsR2ZNdFlVWjNr?=
 =?utf-8?B?R3M3NHhpa0xNSmNNTXVURkFQM05wZEFvTXFqdnY4VjdHSnlRMXZObjkwKzA3?=
 =?utf-8?B?RXh0eUhDdno4U2htWHh4MXpkTFc5TTFPMHRaTkxrZHduZU9RbjBmeDFTMUxk?=
 =?utf-8?B?SG1YbkF6VS9hS0JmajlwYVFQNlFPMmFHVCtJQ3ZuQ29BKy93T09XZVlPdnAx?=
 =?utf-8?B?dkNON3ZvVEFXSVVSbktFd29YQXFINkRSSGhuZllSdHlvOG50U0JUYlJnU3dz?=
 =?utf-8?B?ZC9haFpkakNMa2lWMFkzREhsV2REcnhXOTh5SkJLZzd2Y2dGOWJNS1dpdTJP?=
 =?utf-8?B?YUZkY0MzZXcvMzY4MDJ4K3d0NE5TVGE5NTBibXRvV051bFdlblkzNWRSck9y?=
 =?utf-8?B?R3YveEZ5ME8yL3RxRXFUOVRJczlwLzdLc2JGYTlnTnVZWXFGbXk2THk2RS9w?=
 =?utf-8?B?bUJCWWZabVRoaXRTS0FKeTY5eEhIeU9oK1JmeW51ZUp3R2RFUUE2bWpjSzk1?=
 =?utf-8?B?REErRnNaWmdlNUZCamh5elZiOWRrcS9nbWdxN1BwaCtRK21FUmtWUS9CK21H?=
 =?utf-8?B?VXhVWVNGK3UxUG1JNkgvQXRPYnowNFFJMFg4b2tmQjg1b2trTTYyMm9iQWw1?=
 =?utf-8?Q?k+F3iMs+2VJDckWZ72F2Aelz9VDtk/x0n3Tsgl9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6415a71b-020c-48c4-e348-08d8e7fa7ba2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 21:37:07.6551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSljr7yA/wrYKKCkQHbPvZ+CvdrXtTwr1b1dcYLGTgyGqyZExDwU0qJ6tvZPp8ruTbbigv8X+4xsVPb149H0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Mon, Mar 15, 2021 at 04:18:42PM -0400, Tamas K Lengyel wrote:
> Hi all,
> I've ran into a pretty strange issue. I have a freshly installed 4.15.0-rc3
> system and everything works fine with the stock Ubuntu 20.04
> vmlinuz-5.4.0-66-generic as the dom0 kernel - except vmtrace, which needs a
> newer kernel, that's expected. Now if I boot dom0 with
> vmlinuz-5.8.0-44-generic or vmlinuz-5.10.0-1016-oem I can't start any
> domains because of some strange disk error:
> 
> root@t2:/shared/cfg# xl create ubuntu-20.04.cfg
> Parsing config from ubuntu-20.04.cfg
> libxl: error: libxl_device.c:1109:device_backend_callback: Domain 1:unable
> to add device with path /local/domain/0/backend/vbd/1/51712
> libxl: error: libxl_create.c:1613:domcreate_launch_dm: Domain 1:unable to
> add disk devices

Can you paste the output with `xl -vvv create ...`?

Thanks, Roger.

