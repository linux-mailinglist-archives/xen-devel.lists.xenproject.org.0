Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19034C449C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 13:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279061.476591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNZiJ-0007PQ-7c; Fri, 25 Feb 2022 12:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279061.476591; Fri, 25 Feb 2022 12:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNZiJ-0007Mc-33; Fri, 25 Feb 2022 12:28:47 +0000
Received: by outflank-mailman (input) for mailman id 279061;
 Fri, 25 Feb 2022 12:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZUh1=TI=citrix.com=prvs=04827bf5e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNZiG-0007MV-KZ
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 12:28:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7588896d-9636-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 13:28:40 +0100 (CET)
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
X-Inumbo-ID: 7588896d-9636-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645792123;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oKtYSX1KmB/UzKlONbxyD0KC73ISEOnvwAvXlAp3hHo=;
  b=L0Mi8AdMo95LRzv6z73CiOZAIQENXbGZlto4r7Ap3LeV92pNZP5ACrQ/
   vXhusYSw6Tu0z+T3ELkYFmOzoHzO+1ZbBP9lV09nICahFSlfxZ7VFB1HM
   UTgBO8ZzejVXgL3XAoUhhHxif1STJqFyM7839+2pPCRE2Bkoqo/0ta+nN
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64987199
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yhgSFawzNV0N6l4qyWV6t+fMxirEfRIJ4+MujC+fZmUNrF6WrkUFm
 2dJWTiAM/reNjPwf9x/YY2y9B4Hv8XUzdUyTVdlqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnI6MUz8mLLz1mf1GWElUOAh3ba8dweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5tJNmM+PXwsZTVUJwsQLLFmx921h2SuYxF8sU2XtKc4tj27IAtZj+G2bYu9lsaxbcFSkUGVv
 H7G/mL0GEgybYLEjzGC9xqEg+bVmCrhVYE6Fbum9+Vrilme2mwSDhINUVKx5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U55R+MzOzI4g+fLmkCUjNFLtchsaceRzYny
 1uIlNPBHiF0vfueTnf13qiQhSO/P24SN2BqTS0ZS00D6trqooA2hzrOSMpuFOi+ididJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjrHbchQN6RfGZ2O8tQgpaKWMbtyqsmGOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKF7vEMJGPxf4M4XRfK4Ey/BX1
 XCzK5vEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbQTSN7xktPvc+G05F
 uqz0ePQmn2zt8WkP0HqHXM7dwhWfRDX+7iswyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwUEmWXo2lGNMKlxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JaL+i+JK46sM6S8m4=
IronPort-HdrOrdr: A9a23:wk1CIKOAb7mvhcBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64987199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw1thLJX6rMgArkaRY15fMasmAsHXIKqrMUhYJcWdmvCk9EaCjuhzUMwDhb2INdxd7mZ9LuqhQXcRN4mrSUX9H3U9M+cm01eAvh+Rwyox1S3r9HtP2km0wdJciZawKXz+HOei/AYz6ctF/a+xX2KSOZcakTgh/0ZJbxpb7SW8G8B8AUmxes2I/5JRfUDjEF3uhLGOQdu8IGc0Pam4PPaQ2cKH++EpW0Zp1frm61E6H/d+vYsYKou/41i0cDRq5OPuwTS2DzjpC2Rk9f6E6C8/lz/9ACk99nir6HCxeD0QtLesKf/7S8R0fwbBDdSFAq3TvPKEYGYhYY8eaWwhTZD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKtYSX1KmB/UzKlONbxyD0KC73ISEOnvwAvXlAp3hHo=;
 b=NZGPo5rs/pNHepTP3XRxXiVC5jCOG9k+gP13XloT7vd00IrxNXUe1+0GNB4ZD4eJE6NOuIs9PqscI9H0HUVmWnWlAhBB3VMzTIy1wD8hJDcEWDfzVseWcAUP500RWikNh5Iq7g2DeOZ0tQNFh8QgQpcjpLPdy3Y0jqrWcsEPkcVdAVZob0ut1B5YBSLQW28eNZO/mmV11fbMZ92lPsY6MN7fzuFNPXvgvUzzSWwx/QL8sjINS8O/aDhlsVpWHvaIrc1rTzVY2HpXg7AsHngy2ZMnNnyzSN0aFupVgdoA/vmoHI5/QLZziukCGvRBQJaiKXG0m/f5vQ84zXTMIoUY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKtYSX1KmB/UzKlONbxyD0KC73ISEOnvwAvXlAp3hHo=;
 b=LRdGqismkFQeykYZhXfoNgVK/E8rjKQO9YAJmUjoO72NeUmOsoIInzgOJ8L532jKDAl3xhXrs3RxtFcEx6JDH52t7rPI7xwOAcK1BdcERG2uBAWuOR1/jeAOAPf5FgT1D55EoyBzMIW+w42oqEeovyA93Y3XrEYD19ZuX27NwBQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Thiner Logoer
	<logoerthiner1@163.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Topic: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Index: AQHYKben+W9NHlmgjUe5tEPatIDj2Kyj9FgAgAA+noA=
Date: Fri, 25 Feb 2022 12:28:32 +0000
Message-ID: <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
In-Reply-To: <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60d09915-8bac-4483-7c5f-08d9f85a5620
x-ms-traffictypediagnostic: BYAPR03MB4296:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BYAPR03MB42968E7E11373434E090C882BA3E9@BYAPR03MB4296.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yXnCVCe80IAP7iVeNMrPKr12Rbo6g8H9jTmiv4N7B0WvP70g71Zd41yGcJHn3E8huarWqy1rOyDkUkDupGBBw7SO0i2sexy1GLrbKtCBtRmsiG41fm9K8LDNtf24GOYFSrYeOx8wgv0vnhMHEs9/DGpnpT5iLCuHLLL2b7jgezXpxJVELSctZftEyPnOPKgy/IT2DDGRn7WfvHQmBK9AlnRcqAfnQoqV/+u7LOh6Ar1wKZjFHBRGbavG4TzCthln93PQK28utpQ0AnLusjB7aX8RbP8blgpoICZwgnPx+FEiXwTIQlly0/Pxqm/K1yjjaAycuybMh6n16htDMBEo6Lxm+MDV7859vj7c+c5Sp3IVKggLSeYqEBJTQmy/Px/eHCvHJIaW7QhfzmUBvWeZLcQFoKaymK+1jlNbq+tlDIS4fGg1aGBHYGPq3ryHS9BY8YX4WQBY/3u2ii8MdLdPsRXJK4CJliJuZga8bOFdCuUvGKdiF5XqkBqZ1NbUv9d+Av38p2Ld1eHJ9KkYnYHHdM5ydo3S83BwoowsIDRjPgyPY+X6V+UMm9Mo6lOim75tDEdn6x84F/dNaig/+c51MuBmKBDsd3uMLwn+pItr7xxHakIraOX2RoXa83+kuxOg+FTQa5l1d2gq7JHNVUYlPHBkzsqy8Rijr0JSclmc2IaDa6Sn55M6ZgptT4Nx4mM4SJD5F/vI+NAdZU/2d5doCk+2VZ8ncyyiQnlsqtEUNqrod37LQiQH22Fr7u5T/n316hcAi8roKFcsa3wtqGvF9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(5660300002)(38100700002)(82960400001)(8936002)(83380400001)(38070700005)(122000001)(71200400001)(31696002)(316002)(508600001)(66556008)(53546011)(26005)(66946007)(36756003)(64756008)(8676002)(4326008)(66446008)(66476007)(86362001)(91956017)(6486002)(76116006)(6916009)(54906003)(6506007)(2906002)(31686004)(6512007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGI1T2ZlK2lTaUw3MEtFeFRLZUlyLzVTcEY3V1BOVGJGTnR1OGJxWGp1ckph?=
 =?utf-8?B?UUJxa2p1WTNUMUMyZ3ZydnNJMTFnWkJUc0VZNFBkUnd5akljSmpMM3dJN1Mw?=
 =?utf-8?B?TUR6V2tFNndVSExCZDk4OUl1Zmk4S2xMS0dNM2doTGlKTi9lWjh5eDFPSmY3?=
 =?utf-8?B?WndmdEVRM2RyRndmNTNBSjFJb2lpWFRkcmppY0ppcEtXbk53RkhrdnJ2K3Z5?=
 =?utf-8?B?dnk5N0FCYmJTQ1k3dWxxdmxKWjg5cWk2WWNIc1M1WDZMUFpYRE1mbFE1QkJx?=
 =?utf-8?B?YjVETGRLMmpLWERHMW81RjJvc0RZcXJ6Q09XTUlpWXM1bERLQXNFREtVZzdk?=
 =?utf-8?B?ZHZtRFAwcTMzaGVaT1Z0WnRWUXo4YU5ET2VmZnNGb0hIVVdvei9CRmlXUDA4?=
 =?utf-8?B?Ykpqby9wU0w4UStTK29QWVpVNnR1WlJyZHAyTi9yYUxsTUFKNTNoTjlWRjJu?=
 =?utf-8?B?VlJDY3ZzN2h2eDFsMnpLL2NZbldGdG8zOUJmTThzaUZRWERGeldxZ0djbmFZ?=
 =?utf-8?B?UHMzZUE0djk1WlBxejQrZ0UyZWVnOEoxL1ZlNW9kWVRPdWtQN3RwWVd1SmRP?=
 =?utf-8?B?YnN0OWF3d3lrOTVwMFRTS3ByVVVNMDdlR0hoOGpURDl0N1ZJYTJyc2lpSktC?=
 =?utf-8?B?OXJEL3I3Rit6TnFmN0VKak9RV3hDU1lMSDFsbG1pWlVkQU12dEV4WUF2amR2?=
 =?utf-8?B?djRtd3M1di9NTlVVMVdSV1k0R2FuSkw1YmttSDlWYUZkV24ydlQyaXFTaXZt?=
 =?utf-8?B?VDlKZW9jbElUQ21BczNMUlY4NU8xTUhSVkZnV0hTYllrdDRvYlNBQnVhNkw2?=
 =?utf-8?B?V3hOcTJIRTdiZld2ZlVPYVpKQ3hScC9UNzNmWGsvYXNNMHZYR3d2Ylh1eHRi?=
 =?utf-8?B?U3RzZlBidnc4YkhkYzdaL2sxTDNpYWVkVWU2dlUyc0pUdlhka043UTZjVmtm?=
 =?utf-8?B?NmZsK3pwVTFhZDZyaS9kRGh1SlR1UElpaWEvdmcvL3VDWWNFRjlYamljenln?=
 =?utf-8?B?eXVhVC9sR1VZU2dMazk1bEpCN1lDSnRpMGhLSldwMGxXNFZ3S3ZZMEdiSTNC?=
 =?utf-8?B?emU0WWVzYjY4elQzYStmcmVSeFNVZjVSMlllQmJIaWgxVityZzJFSHZUYk12?=
 =?utf-8?B?ci82dWZMQTlMSFJoZS83UXlUTStqRWtxandnOHdIUkd1NWNlM0tyZVBOQitQ?=
 =?utf-8?B?ZEFTekRKWDN3cHdaMWdzSUFOelI2RWU4NWc3bCtKUjk1QlNlUktBbVdGcVRj?=
 =?utf-8?B?R3VVTWlLL2ttUHlKeWVqSXdHS2xWODZmNU14MmpHcTJMR1NpL1pwYmcvYUkv?=
 =?utf-8?B?eXNxaHE1cDFwMmM2ZVZ6U2hBYUc1OTlCcVQrelhjWnJZTko4SEJSOEg5S3Mv?=
 =?utf-8?B?b0liMytwOVVZVnA1cDNRT2ZCcEd1OVVkcnI1SnB4dk9RemFTdkxHRElWVGVH?=
 =?utf-8?B?QWFrRk5oREhUczlvN0I2aU1vSjluTEpNTDdNYzQ2d093UkpVOGZicVdaV09n?=
 =?utf-8?B?TVdwQ3pYOTNVaWs5eW5HRXNqNnVveXVSUVlHcTlqQmd5L205NU5zL25UbU1u?=
 =?utf-8?B?bXdEbThkY1FKOWtaV2hBZ2ozTVNHbmw3NmVHWFM5Y1BkR3p1SjUxZU80UGY0?=
 =?utf-8?B?WmVDRVgwcW0rQmJMaTUrcm1wNFp3RXc1cEVraE1kZmZaY0RkMlVGb2lIZEoy?=
 =?utf-8?B?aU81aGswMFNsZUNsNmRUS2lhYnF2NEdIRWNwK2JXSFRYak1FMEh0UHVuTWtu?=
 =?utf-8?B?VTV5MmQ5MEVNNkY0T3lDMTlQalVvV3JNcHpuOHc1V0tLcVc2Wi8ydmx3OHFH?=
 =?utf-8?B?MjZOQmt3R3p0NmhhdUNoVmc4YzhoajVLQnNlWVNCZGNLVCs2aldsVzUwNlI3?=
 =?utf-8?B?M3lvNjMvRFN0VGx5QmFZT2lIYzF0VGtjdE5welg0bkdBb2txVzBjMEtKSWx0?=
 =?utf-8?B?dnA3d3JsMFUwZEtTL3VVczVDbmlRaHpVUkxNS3k4aFk4YkNnd1JlRmZqalN4?=
 =?utf-8?B?bkdrVWV5cjdVVkx6S0ZlZmEzdmlXS1haRkxSUTJXM0J6NVdwTWpZVVlUL1J0?=
 =?utf-8?B?R3VOU0F2NlBqVlVIQWpmQjcxdXVhN0N0MFgycldMZ0pvWUN4V2dCcjBEWXY0?=
 =?utf-8?B?ZTRXbDJVQVhweExUWnV1NFBLbmlCYW5WNlZYeWdQN0JwUDVTVnJsU3hQRXps?=
 =?utf-8?B?cEErSnc1MzhZbHZLUEJrSXVTQXVUUXlyQm1ZK25JNEFidEhMTkJ6MlRWVjVj?=
 =?utf-8?B?bEJjZWVMOHU4WWpNbUZYdHFoam1BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A088CE51542225429BC0A33B8EFB798E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d09915-8bac-4483-7c5f-08d9f85a5620
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 12:28:32.4881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wiPrTS1xVI51PBqP66ILtiFHSMldiJV5THUetD7RkaezTNqWLyw1du5aUqb3+O7D+JYSIPRHCb9OumPNe5S1jfIPscNJMomwAjLAgE/j1oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4296
X-OriginatorOrg: citrix.com

T24gMjUvMDIvMjAyMiAwODo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI0LjAyLjIwMjIg
MjA6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBJbiBWTVggb3BlcmF0aW9uLCB0aGUgaGFu
ZGxpbmcgb2YgSU5JVCBJUElzIGlzIGNoYW5nZWQuICBFWElUX1JFQVNPTl9JTklUIGhhcw0KPj4g
bm90aGluZyB0byBkbyB3aXRoIHRoZSBndWVzdCBpbiBxdWVzdGlvbiwgc2ltcGx5IHNpZ25hbHMg
dGhhdCBhbiBJTklUIHdhcw0KPj4gcmVjZWl2ZWQuDQo+Pg0KPj4gSWdub3JpbmcgdGhlIElOSVQg
aXMgcHJvYmFibHkgdGhlIHdyb25nIHRoaW5nIHRvIGRvLCBidXQgaXMgaGVscGZ1bCBmb3INCj4+
IGRlYnVnZ2luZy4gIENyYXNoaW5nIHRoZSBkb21haW4gd2hpY2ggaGFwcGVucyB0byBiZSBpbiBj
b250ZXh0IGlzIGRlZmluaXRlbHkNCj4+IHdyb25nLiAgUHJpbnQgYW4gZXJyb3IgbWVzc2FnZSBh
bmQgY29udGludWUuDQo+Pg0KPj4gRGlzY292ZXJlZCBhcyBjb2xsYXRlcmFsIGRhbWFnZSBmcm9t
IHdoZW4gYW4gQVAgdHJpcGxlIGZhdWx0cyBvbiBTMyByZXN1bWUgb24NCj4+IEludGVsIFRpZ2Vy
TGFrZSBwbGF0Zm9ybXMuDQo+IEknbSBhZnJhaWQgSSBkb24ndCBmb2xsb3cgdGhlIHNjZW5hcmlv
LCB3aGljaCB3YXMgKG9ubHkpIG91dGxpbmVkIGluDQo+IHBhdGNoIDE6IFdoeSB3b3VsZCB0aGUg
QlNQIHJlY2VpdmUgSU5JVCBpbiB0aGlzIGNhc2U/DQoNClNIVVRET1dOIGlzIGEgc2lnbmFsIGVt
aXR0ZWQgYnkgYSBjb3JlIHdoZW4gaXQgY2FuJ3QgY29udGludWUuwqAgVHJpcGxlDQpmYXVsdCBp
cyBvbmUgY2F1c2UsIGJ1dCBvdGhlciBzb3VyY2VzIGluY2x1ZGUgYSBkb3VibGUgI01DLCBldGMu
DQoNClNvbWUgZXh0ZXJuYWwgY29tcG9uZW50LCBpbiB0aGUgUENIIEkgZXhwZWN0LCBuZWVkcyB0
byB0dXJuIHRoaXMgaW50byBhDQpwbGF0Zm9ybSByZXNldCwgYmVjYXVzZSBvbmUgbWFsZnVuY3Rp
b25pbmcgY29yZSBjYW4ndC7CoCBJdCBpcyB3aHkgYQ0KdHJpcGxlIGZhdWx0IG9uIGFueSBsb2dp
Y2FsIHByb2Nlc3NvciBicmluZ3MgdGhlIHdob2xlIHN5c3RlbSBkb3duLg0KDQo+IEFuZCBpdCBh
bHNvIGNhbm5vdCBiZSB0aGF0IHRoZSBJTklUIHdhcyByZWNlaXZlZCBieSB0aGUgdkNQVSB3aGls
ZSBydW5uaW5nIG9uDQo+IGFub3RoZXIgQ1BVOg0KDQpJdCdzIG5vdGhpbmcgKHJlYWxseSkgdG8g
ZG8gd2l0aCB0aGUgdkNQVS7CoCBJTklUIGlzIGEgZXh0ZXJuYWwgc2lnbmFsIHRvDQp0aGUgKHJl
YWwpIEFQSUMsIGp1c3QgbGlrZSBOTUkvZXRjLg0KDQpJdCBpcyB0aGUgbmV4dCBWTUVudHJ5IG9u
IGEgQ1BVIHdoaWNoIHJlY2VpdmVkIElOSVQgdGhhdCBzdWZmZXJzIGENClZNRW50cnkgZmFpbHVy
ZSwgYW5kIHRoZSBWTUVudHJ5IGZhaWx1cmUgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUNCmNv
bnRlbnRzIG9mIHRoZSBWTUNTLg0KDQpJbXBvcnRhbnRseSBmb3IgWGVuIGhvd2V2ZXIsIHRoaXMg
aXNuJ3QgYXBwbGljYWJsZSBmb3Igc2NoZWR1bGluZyBQVg0KdkNQVXMsIHdoaWNoIGlzIHdoeSBk
b20wIHdhc24ndCB0aGUgb25lIHRoYXQgY3Jhc2hlZC7CoCBUaGlzIGFjdHVhbGx5DQptZWFudCB0
aGF0IGRvbTAgd2FzIGFsaXZlIGFuIHVzYWJsZSwgYWxiZWl0IGl0IHNoYXJpbmcgYWxsIHZDUFVz
IG9uIGENCnNpbmdsZSBDUFUuDQoNCg0KVGhlIGNoYW5nZSBpbiBJTklUIGJlaGF2aW91ciBleGlz
dHMgZm9yIFRYVCwgd2hlcmUgaXMgaXQgY3JpdGljYWwgdGhhdA0Kc29mdHdhcmUgY2FuIGNsZWFy
IHNlY3JldHMgZnJvbSBSQU0gYmVmb3JlIHJlc2V0dGluZy7CoCBJJ20gbm90IHdhbnRpbmcNCnRv
IGdldCBpbnRvIGFueSBvZiB0aGF0IGJlY2F1c2UgaXQncyBmYXIgbW9yZSBjb21wbGljYXRlZCB0
aGFuIEkgaGF2ZQ0KdGltZSB0byBmaXguDQoNClhlbiBzdGlsbCBpZ25vcmVzIHRoZSBJTklULCBi
dXQgbm93IGRvZXNuJ3QgY3Jhc2ggYW4gZW50aXJlbHkgaW5ub2NlbnQNCmRvbWFpbiBhcyBhIHNp
ZGUgZWZmZWN0IG9mIHRoZSBwbGF0Zm9ybSBzZW5kaW5nIGFuIElOSVQgSVBJLg0KDQp+QW5kcmV3
DQoNClAuUy4gVGhpcyBpcyBhbHNvIGZ1biB3aXRob3V0IGludGVycnVwdCByZW1hcHBpbmcuwqAg
WFNBLTMgZGlkbid0IGltYWdpbmUNCnRoZSBmdWxsIHNjb3BlIG9mIHByb2JsZW1zIHdoaWNoIGNv
dWxkIG9jY3VyLg0K

